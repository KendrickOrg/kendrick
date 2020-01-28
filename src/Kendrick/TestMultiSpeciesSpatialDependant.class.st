Class {
	#name : #TestMultiSpeciesSpatialDependant,
	#superclass : #TestCase,
	#instVars : [
		'beforeSimulator',
		'afterSimulator',
		'beforeModel',
		'afterModel',
		'beforeDiagram',
		'afterDiagram'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> after [

ModelComponent Infuenza.
	
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
		5 -- rho --> 1.
	).
		
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu v);
	gamma: 0.25;
	v: 0.00274;
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		R -- v --> S.
	).	
		
KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	addTransition:	#(Empty -- mu --> S.);
	addTransition: #(status -- mu --> Empty.);
	delay: #(sigma , S -- lambda --> I  , E).
		
Composition MultiSpeciesSpatial
	populationSize: 27500;
	model: 'Demographical';
	model: 'Biological';
	model: 'SEIR';
	mu_species: #(0.0000365 0.00137);
	sigma_species: #(0.5 0.67);
	gamma_species: #(0.25 0.233);
	rho_species: #(0.03 0.1);
	beta_species: #(
		#(0 0.21)
		#(0 0.42)
	);
	lambda: #(beta*I_patch/N sum);
	N: #(patch_species);
	S_species_patch: #(
		#(500 500 500 500 500)
		#(4990 5000 5000 5000 5000)
	);
	I_species_patch: #(
		#(0 0 0 0 0)
		#(10 0 0 0 0)
	).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'MultiSpeciesSpatial';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	for: 'SpatialRungeKutta';
	data: #(I_species);
	legendTitle: 'Total of Infectious';
	legends: #('humans' 'birds');
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> afterBench [

ModelComponent Infuenza.
	
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
		5 -- rho --> 1.
	).
		
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu v);
	gamma: 0.25;
	v: 0.00274;
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		R -- v --> S.
	).	
		
KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	addTransition:	#(Empty -- mu --> S.);
	addTransition: #(status -- mu --> Empty.);
	delay: #(sigma , S -- lambda --> I  , E).
		
Composition MultiSpeciesSpatial
	populationSize: 27500;
	model: 'Demographical';
	model: 'Biological';
	model: 'SEIR';
	mu_species: #(0.0000365 0.00137);
	sigma_species: #(0.5 0.67);
	gamma_species: #(0.25 0.233);
	rho_species: #(0.03 0.1);
	beta_species: #(
		#(0 0.21)
		#(0 0.42)
	);
	lambda: #(beta*I_patch/N sum);
	N: #(patch_species);
	S_species_patch: #(
		#(500 500 500 500 500)
		#(4990 5000 5000 5000 5000)
	);
	I_species_patch: #(
		#(0 0 0 0 0)
		#(10 0 0 0 0)
	).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'MultiSpeciesSpatial';
	from: 0; 
	to: 500; 
	step: 1;
	init;
	execute.
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> before [

|model spatialConcern simulator db multiHostConcern seirsConcern data |
model := KEModel new.

"Multi-host concern"
multiHostConcern := KEModelPart new.
multiHostConcern
   addAttribute: #species 
   value: #(#human #bird).

"Spatial concern"
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

"SEIRS concern"
seirsConcern := KEModelPart new.
seirsConcern attributes: {#status->#(#S #E #I #R)}.
seirsConcern addParameters: { #beta. #gamma. #mu. #sigma. #nu }.
seirsConcern addParameter: #lambda value: [ :aModel | 
            (aModel atParameter: #beta) * 
            (aModel atCompartment: {#status->#I}) / (aModel atParameter: #N) ].
seirsConcern
        addTransitionFrom: {#status -> #S}
        to: {#status -> #E}
        probability: [ :aModel | 
            (aModel atParameter: #lambda) ].
    seirsConcern 
        addTransitionFrom: {#status -> #E} 
        to: {#status -> #I} 
        probability: [ :aModel | aModel atParameter: #sigma ].
    seirsConcern 
        addTransitionFrom: {#status -> #I}
        to: {#status -> #R} 
        probability: [ :aModel | aModel atParameter: #gamma ].
    seirsConcern 
        addTransitionFrom: {#status -> #R} 
        to: {#status -> #S}
        probability: [ :aModel | aModel atParameter: #nu ].
    #(S E I R) do: [ :each| 
        seirsConcern 
            addTransitionFrom: {#status->each}
            to: #empty 
            probability: [ :aModel | aModel atParameter: #mu ].
        ].
    seirsConcern 
        addTransitionFrom: #empty 
        to: {#status -> #S}
        probability: [ :aModel | aModel atParameter: #mu ].

"Concerns integration"

    model integrate: spatialConcern.
    model integrate: multiHostConcern.
    model integrate: seirsConcern.

    model atParameter: #mu assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.0000365 ].
        c = #bird ifTrue: [ val := 0.00137 ].
        val ].
    model atParameter: #sigma assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.5 ].
        c = #bird ifTrue: [ val := 0.67 ].
        val ].
    model atParameter: #gamma assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.25 ].
        c = #bird ifTrue: [ val := 0.233 ].
        val ].
    model atParameter: #nu assignValue: 0.00274.
    model atParameter: #N assignValue: [ :aModel| |c| 
        c := OrderedCollection new.
        c add: (aModel currentCompartment at: #patch).
        c add: (aModel currentCompartment at: #species).
        aModel sizeOfPopulation: (c asArray)
    ].
    model atParameter: #rho assignValue: [ :aModel| |c val|
        c := aModel currentCompartment at: #species.
        c = #bird ifTrue: [ val := 0.1 ].
        c = #human ifTrue: [ val := 0.03 ].
        val
    ].
    model atParameter: #beta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := #(0 0.21) ].
        c = #bird ifTrue: [ val := #(0 0.42) ].
        val
    ]. 
    model atParameter: #lambda assignValue: [ :aModel| |c|
        c := aModel currentCompartment at: #patch.
        ((aModel atParameter: #beta) *
        (aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)) sum.
    ].
    model 
        atCompartment: { #status->#S. #species->#bird. #patch->1 } 
        put: 4990
        atOthersPut: 0.
    model 
        atCompartment: { #status->#I. #species->#bird. #patch->1 } 
        put: 10.
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

"Run the model with RK4"
simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
    simulator executeOn: model.
	data := OrderedCollection new.
	data add: (simulator timeSeriesOutputsAt: {#status -> #I. #species -> #bird}).
	data add: (simulator timeSeriesOutputsAt: {#status ->  #I. #species ->#human}).
	db := KEDiagramBuilder new data: data.
    db xLabel: 'Time (days)'.
    db legendTitle: 'Total of infectious'.
    db legends: { 'birds'. 'humans' }.

    db open.

	^ { simulator . model . db}
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> beforeBench [

|model  spatialConcern simulator multiHostConcern seirsConcern f |
model := KEModel new.

"Multi-host concern"
multiHostConcern := KEModelPart new.
multiHostConcern
   addAttribute: #species 
   value: #(#human #bird).

"Spatial concern"
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

"SEIRS concern"
seirsConcern := KEModelPart new.
seirsConcern attributes: {#status->#(#S #E #I #R)}.
seirsConcern addParameters: { #beta. #gamma. #mu. #sigma. #nu }.
seirsConcern addParameter: #lambda value: [ :aModel | 
            (aModel atParameter: #beta) * 
            (aModel atCompartment: {#status-> #I}) / (aModel atParameter: #N) ].
seirsConcern
        addTransitionFrom: {#status -> #S}
        to: {#status -> #E}
        probability: [ :aModel | 
            (aModel atParameter: #lambda) ].
    seirsConcern 
        addTransitionFrom: {#status -> #E} 
        to: {#status -> #I}
        probability: [ :aModel | aModel atParameter: #sigma ].
    seirsConcern 
        addTransitionFrom: {#status -> #I}
        to: {#status -> #R} 
        probability: [ :aModel | aModel atParameter: #gamma ].
    seirsConcern 
        addTransitionFrom: {#status -> #R}
        to: {#status -> #S} 
        probability: [ :aModel | aModel atParameter: #nu ].
    #(S E I R) do: [ :each| 
        seirsConcern 
            addTransitionFrom: {#status->each}
            to: #empty 
            probability: [ :aModel | aModel atParameter: #mu ].
        ].
    seirsConcern 
        addTransitionFrom: #empty 
        to: {#status -> #S}
        probability: [ :aModel | aModel atParameter: #mu ].

"Concerns integration"

    model integrate: spatialConcern.
    model integrate: multiHostConcern.
    model integrate: seirsConcern.

    model atParameter: #mu assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.0000365 ].
        c = #bird ifTrue: [ val := 0.00137 ].
        val ].
    model atParameter: #sigma assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.5 ].
        c = #bird ifTrue: [ val := 0.67 ].
        val ].
    model atParameter: #gamma assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.25 ].
        c = #bird ifTrue: [ val := 0.233 ].
        val ].
    model atParameter: #nu assignValue: 0.00274.
    model atParameter: #N assignValue: [ :aModel| |c| 
        c := OrderedCollection new.
        c add: (aModel currentCompartment at: #patch).
        c add: (aModel currentCompartment at: #species).
        aModel sizeOfPopulation: (c asArray)
    ].
    model atParameter: #rho assignValue: [ :aModel| |c val|
        c := aModel currentCompartment at: #species.
        c = #bird ifTrue: [ val := 0.1 ].
        c = #human ifTrue: [ val := 0.03 ].
        val
    ].
    model atParameter: #beta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := #(0 0.21) ].
        c = #bird ifTrue: [ val := #(0 0.42) ].
        val
    ]. 
    model atParameter: #lambda assignValue: [ :aModel| |c|
        c := aModel currentCompartment at: #patch.
        ((aModel atParameter: #beta) *
        (aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)) sum.
    ].
    model 
        atCompartment: { #status->#S. #species->#bird. #patch->1 } 
        put: 4990
        atOthersPut: 0.
    model 
        atCompartment: { #status->#I. #species->#bird. #patch->1 } 
        put: 10.
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

"Run the model with RK4"
simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
    simulator executeOn: model.

]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> bench [

	| before after |
	
	before := self benchmark: [self beforeBench] times: 100.
	after := self benchmark: [self afterBench] times: 100.
	
	Transcript 
		show: before; cr; 
		show: after; cr; 
		show: (after at: 1) / (before at: 1); cr; cr.
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> benchmark: aBlock times: anInteger [

	"µ the average time in ms and τ standard deviation"

	| runs average deviation |

	runs := [ 
		(1 to: anInteger) 
			collect: [ :each | Time millisecondsToRun: aBlock ] ] 
		valueUnpreemptively.
	average := runs average asFloat.
	deviation := ((runs 
		detectSum: [ :each | (each - average) * (each - average) ]) 
			/ runs size) sqrt.
	^ Array with: average with: deviation
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> createModels [

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'Infuenza'.
	afterDiagram := (Visualization withId: 'SpatialDiagramViz') open.	
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialDependant >> testEquivalence [


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
