Class {
	#name : #TestsModel5,
	#superclass : #TestsIST,
	#instVars : [
		'beforeSimulator',
		'beforeModel',
		'beforeDiagram',
		'afterSimulator',
		'afterModel',
		'afterDiagram'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestsModel5 >> after [

KendrickModel SEIRS
    attribute: #(status -> S E I R);
    parameters: #(beta lambda gamma mu sigma nu);
    lambda: #(beta*I/N);
    transitions: #(
        S -- lambda --> E.
        E -- sigma --> I.
        I -- gamma --> R.
        R -- nu --> S.
        status -- mu --> Empty.
        Empty -- mu --> S.).

KendrickModel SEIIRS
	extends: 'SEIRS';
	parameters: #(beta1 beta2);
	splitStatus: #(I index #(1 2)).

KendrickModel Biological
	attribute: #(species -> human bird).
	
KendrickModel Demographical
	attribute: #(patch -> 1  2  3  4  5);
	parameters: #(rho);
	transitions: #(
		1 -- rho --> 2.
		2 -- rho --> 3.
		3 -- rho --> 4.
		4 -- rho --> 5.
		5 -- rho --> 1.).
	
Composition SEIIRSCombo
	model: 'SEIIRS';
	model: 'Demographical';
	model: 'Biological';
	lambda: #((beta1*(I1_patch/N))+(beta2*(I2_patch/N)) sum);
	N: #(patch_species).
	
Scenario InfuenzaScenario1
	on: 'SEIIRSCombo';
	populationSize: 27500;
	beta1_species: #(#(0 0.21) #(0 0.42));
	beta2_species: #(#(0 0.021) #(0 0.042));
	nu: 0.00274;		
	rho_species: #(0.03 0.1);
	gamma_species_status: #(
		#(0 0 0 0 0.25 0.0025)
		#(0 0 0 0 0.233 0.0023)
	);
	sigma_species_status_next: #(
		#(0 0 0 0 0.5 0.005)
		#(0 0 0 0 0.67 0.0067)
	);
	S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
	I1_species_patch: #(#(0 0 0 0 0) #(9 0 0 0 0));
	I2_species_patch: #(#(0 0 0 0 0) #(1 0 0 0 0));
	mu_species: #(0.000365 0.00137).

Simulation SEIIRSInfluenzaRK rungeKutta
	scenario: 'InfuenzaScenario1';
	from: 0.0; 
	to: 500; 
	step: 1.
	
Visualization SEIIRSInfluenzaViz diagram 
	for: 'SEIIRSInfluenzaRK';
	data: #(I1_species I2_species); "I2_Species"
	legendTitle: 'Total of Infectious';
	legends: #('birds strains 1' 'humans strains 1' 'birds strains 2' 'humans strains 2');
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestsModel5 >> before [

		
	| model SEIRSConcern twoStrains multiHostConcern spatialConcern simulator dB f|
	
	model := KEModel new.
	model population: (KEPopulation size: 27500).
      SEIRSConcern := KEModelPart new.
	SEIRSConcern addAttribute: #status value: #(S E I R).
	SEIRSConcern addParameters: { #beta. #gamma. #mu. #sigma. #nu }.
	SEIRSConcern addParameter: #lambda value: 'beta*I/N'.
	SEIRSConcern
		addTransitionFrom: {#status -> #S}
		to: {#status -> #E}
		probability: [ :aModel | 
			(aModel atParameter: #lambda) ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #E}
		to: {#status -> #I} 
		probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #I} 
		to: {#status -> #R} 
		probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #R}
		to: {#status -> #S} 
		probability: [ :aModel | aModel atParameter: #nu ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #S} 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #I} 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #R}
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: {#status -> #E}
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: #empty 
		to: {#status -> #S} 
		probability: [ :aModel | aModel atParameter: #mu ].
	
	twoStrains := KEModelPart dependOn: SEIRSConcern.
	twoStrains transitions: (SEIRSConcern transitions 
		select: [:tr| ((tr from at: #status) = #I) | ((tr to at: #status) = #I) ]).
	twoStrains splitStatus: {  #(I). #index->#(1 2) }.
	twoStrains addParameters: { #beta1. #beta2 }.
	
	multiHostConcern := KEModelPart new.
	multiHostConcern addAttribute: #species value: #(#human #bird).
	
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #patch value: (1 to: 5) asArray.
	spatialConcern addParameter: #rho.
   (1 to: 5) do: [ :i| 
        (i < 5) 
        ifTrue: [  
            spatialConcern 
                addTransitionFrom: { #patch->i } 
                to: { #patch->(i+1) } 
                probability: [ :aModel| aModel atParameter: #rho ].
        ]
        ifFalse: [  
            spatialConcern 
                addTransitionFrom: { #patch->i } 
                to: { #patch->1 } 
                probability: [ :aModel| aModel atParameter: #rho ].
        ]
    ]. 
	
	model integrate: SEIRSConcern.
	model integrate: twoStrains.
	model integrate: spatialConcern.
	model integrate: multiHostConcern.
	
	
	
	model addParameter: #beta1 value: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := #(0 0.21) ].
		c = #bird ifTrue: [ val := #(0 0.42) ].
		val
	].
	model addParameter: #beta2 value: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := #(0 0.021) ].
		c = #bird ifTrue: [ val := #(0 0.042) ].
		val
	].
	model atParameter: #lambda assignValue: [ :aModel| |c|
		c := aModel currentCompartment at: #patch.
		(((aModel atParameter: #beta1) *
		(aModel atCompartment: {#status->#I1. #patch->c})/(aModel atParameter: #N))
		+ ((aModel atParameter: #beta2) *
		(aModel atCompartment: {#status->#I2. #patch->c})/(aModel atParameter: #N))) sum.
	].
	model atParameter: #gamma assignValue: [ :aModel| |c1 c2 val| 
		c1 := aModel currentCompartment at: #species.
		c2 := aModel currentCompartment at: #status.
		(c1 = #human & c2 = #I1)  ifTrue: [ val := 0.25 ].
		(c1 = #human & c2 = #I2)  ifTrue: [ val := 0.0025 ].
		(c1 = #bird & c2 = #I1)  ifTrue: [ val := 0.233 ].
		(c1 = #bird & c2 = #I2)  ifTrue: [ val := 0.0023 ].
		val ].
	model atParameter: #sigma assignValue: [ :aModel| |c1 c2 val| 
		c1 := aModel currentCompartment at: #species.
		c2 := aModel nextCompartment at: #status.
		(c1 = #human & c2 = #I1)  ifTrue: [ val := 0.5 ].
		(c1 = #human & c2 = #I2)  ifTrue: [ val := 0.005 ].
		(c1 = #bird & c2 = #I1)  ifTrue: [ val := 0.67 ].
		(c1 = #bird & c2 = #I2)  ifTrue: [ val := 0.0067 ].
		val ].
	model atParameter: #mu assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.000365 ].
		c = #bird ifTrue: [ val := 0.00137 ].
		val ].
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := OrderedCollection new.
		c add: (aModel currentCompartment at: #patch).
		c add: (aModel currentCompartment at: #species).
		aModel sizeOfPopulation: (c asArray)
	].
	model atParameter: #nu assignValue: 0.00274.
	model atParameter: #rho assignValue: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #bird ifTrue: [ val := 0.1 ].
		c = #human ifTrue: [ val := 0.03 ].
		val
	].
	
	model 
		atCompartment: { #status->#S. #species->#bird. #patch->1 } 
		put: 4990
		atOthersPut: 0.
	model 
		atCompartment: { #status->#I1. #species->#bird. #patch->1 } 
		put: 9.
	model 
		atCompartment: { #status->#I2. #species->#bird. #patch->1 } 
		put: 1.
	2 to: 5 do: [ :i| 
		model 
			atCompartment: { #status->#S. #species->#bird. #patch->i } 
			put: 5000.
	].
	1 to: 5 do: [ :i| 
		model 
			atCompartment: { #status->#S. #species->#human. #patch->i } 
			put: 500 
	].
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 500 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	f := [:name| |d tmp|
		tmp := (simulator timeSeriesOutputsAt: name) collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
		].
	dB addData: { 
		(f value: {#status -> #I1.#species -> #bird}). 
		(f value: {#status -> #I1.#species -> #human}).
		(f value: {#status ->#I2. #species -> #bird}). 
		(f value: {#status -> #I2. #species -> #human}) }.

	dB xLabel: 'Time (days)'.
	dB legendTitle: 'Total of infectious'.
	dB legends: { 'birds strains 1'. 'humans strains 1'. 'birds strains 2'. 'humans strains 2' }.
	dB open.
	
	^ {simulator . model . dB}
]

{ #category : #'as yet unclassified' }
TestsModel5 >> createModels [

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'SEIIRSInfluenzaRK'.
	afterModel := ModelComponent withId: 'Influenza'.
	afterDiagram := (Visualization withId: 'SEIIRSInfluenzaViz') open.	
]

{ #category : #'as yet unclassified' }
TestsModel5 >> script [

ModelComponent Influenza.

KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).	
		
KendrickModel SEIRS
	extends: 'SIR';
	parameters: #(sigma nu);
	delay: #(sigma , S -- lambda --> I  , E);
	addTransition:	#(R -- nu --> S.);
	addTransition: #(E -- mu --> Empty.).

KendrickModel SEIIRS
	extends: 'SEIRS';
	parameters: #(beta1 beta2);
	splitStatus: #(I strains #(1 2)).

KendrickModel Biological
	attribute: #(species -> human bird).
	
KendrickModel Demographical
	attribute: #(patch -> 1  2  3  4  5);
	parameters: #(rho);
	rho: 0.03;
	transitions: #(
		1 -- rho --> 2.
		2 -- rho --> 3.
		3 -- rho --> 4.
		4 -- rho --> 5.
		5 -- rho --> 1.).
	
Composition SEIIRSCombo
	populationSize: 27500;
	model: 'SEIIRS';
	model: 'Demographical';
	model: 'Biological';
	beta1_species: #(#(0 0.21) #(0 0.42));
	beta2_species: #(#(0 0.021) #(0 0.042));
	lambda: #(beta1*(I1_patch/N)+beta2*(I2_patch/N) sum);
	gamma_species_status: #(
		#(0 0 0.25 0.0025 0 0);
		#(0 0 0.233 0.0023 0 0);
	);
	sigma_species_status: #(
		#(0 0 0.5 0.005 0 0);
		#(0 0 0.67 0.0067 0);
	);
	mu_species: #(0.0000365 0.00137);
	N: #(species_patch);
	nu: 0.00274;		
	"delta_species: #(0.068 0.055);
	epsilon_species: #(0.096 0.082);"
	rho_species: #(0.03 0.1 0);
	S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
	I1_species_patch: #(#(0 0 0 0 0) #(9 0 0 0 0));
	I2_species_patch: #(#(0 0 0 0 0) #(1 0 0 0 0)).

Simulation SEIIRSInfluenzaRK rungeKutta
	for: 'SEIIRSCombo';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SEIIRSInfluenzaViz diagram 
	for: 'SEIIRSInfluenzaRK';
	data: #(I2_species); "I2_Species"
	legendTitle: 'Total of Infectious';
	legends: #('birds strains 1' 'humans strains 1' 'birds strains 2' 'humans strains 2');
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestsModel5 >> testEquivalence [


	| resultsBefore resultsAfter |
	self createModels.

	beforeModel inspect.
	afterModel keModel inspect.

	"correct (check inspector) -- but timeseries are presented in different order fix"

	resultsBefore := (beforeDiagram data collect: [ :ts | ts peakOfEpidemic floor ]) sorted asOrderedCollection.
	resultsAfter := (afterDiagram data collect: [ :ts | ts peakOfEpidemic floor ]) sorted asOrderedCollection.
	Transcript show: resultsBefore; cr; show: resultsAfter; cr; cr.
	self assert: resultsBefore = resultsAfter.
]

{ #category : #'as yet unclassified' }
TestsModel5 >> testScript [
]

{ #category : #'as yet unclassified' }
TestsModel5 >> vizId [

	^ 'SEIIRSInfluenzaViz'
]
