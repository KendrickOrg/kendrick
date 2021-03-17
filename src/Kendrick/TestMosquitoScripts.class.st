Class {
	#name : #TestMosquitoScripts,
	#superclass : #TestCase,
	#instVars : [
		'beforeSimulator',
		'afterSimulator',
		'beforePair',
		'beforeModel',
		'afterModel'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestMosquitoScripts >> after [

ModelComponent Mosquito
	population: 13000;
	attribute: #(status -> S I R); 
	parameters: #(mu gamma beta lambda rho);
	mu: 12.17;
	gamma: 52;
	beta: 1;
	lambda: #(beta*I);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).

KModel SpeciesConcern
	attribute: #(species -> mosquito reservoir1 reservoir2).
		
Composition MultiMosquito
	model: 'SpeciesConcern';	
	S_species: #(9999 1000 2000);
	I_species: #(1 0 0);
	"others: 0;"
	N: #(species);
	mu_species: #(12.17 0.05 0.05);
	rho_species: #(
		#(0 0.02 0.02) 
		#(0.02 0 0) 
		#(0.02 0 0)
	);
	lambda: #(beta*rho*I sum).

Simulation MosquitoGillepsie gillespie
	for: 'MultiMosquito';
	from: 0.0; 
	to: 0.5; 
	step: 0.0027.
	
Visualization MosquitoDiagramViz chart 
	for: 'MosquitoGillepsie';
	data: #(I sqrt);
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestMosquitoScripts >> before [

| model multiHostConcern simulator chart |
model := KEModel new.
model attributes: {(#status -> #(#S #I #R))}.
model addParameter: #mu value: 12.17.
model addParameter: #gamma value: 52.
model addParameter: #beta value: 1.
model addParameter: #lambda value: [ :aModel| 
        (aModel atParameter: #beta) * 
        (aModel atCompartment: {#status->#I}) ].
model
   addTransitionFrom: {#status -> #S}
   to: {#status -> #I}
   probability: [ :m | m atParameter: #lambda ].
model 
   addTransitionFrom: {#status-> #I} 
   to: {#status -> #R} 
        probability: [ :m | m atParameter: #gamma ].
    #(#S #I #R) do: [ :each| 
        model 
            addTransitionFrom: {#status->each} 
            to: { #status->#empty }  
            probability: [ :m | m atParameter: #mu ].
        ].
model 
        addTransitionFrom: { #status->#empty }  
        to: {#status -> #S}
        probability: [ :m | m atParameter: #mu ].

multiHostConcern := KEModelPart new.
multiHostConcern 
   addAttribute: #species 
   value: #(#mosquito #reservoir1 #reservoir2).

model integrate: multiHostConcern.

model 
        atParameter: #mu
        assignValue: 
        [ :aModel| |c val| 
            c := aModel currentCompartment at: #species.
            c = #mosquito ifTrue: [ val := 12.17 ].
            c = #reservoir1 ifTrue: [ val := 0.05 ].
            c = #reservoir2 ifTrue: [ val := 0.05 ].
            val
        ].
model atParameter: #N assignValue: [ :aModel| |c| 
        c := aModel currentCompartment at: #species.
        aModel sizeOfPopulation: c asArray
        ].
model addParameter: #rho value: [ :aModel| |c val|
        c := aModel currentCompartment at: #species.
        c = #mosquito ifTrue: [ val := #(0 0.02 0.02) ].
        c = #reservoir1 ifTrue: [ val := #(0.02 0 0) ].
        c = #reservoir2 ifTrue: [ val := #(0.02 0 0) ].
        val
        ].
model atParameter: #lambda assignValue: [ :aModel|
        ((aModel atParameter: #beta) * 
        (aModel atParameter: #rho) * 
        (aModel atCompartment: {#status->#I})) sum
        ].

    model atCompartment: { #status->#I. #species->#mosquito } put: 1 atOthersPut: 0.
    model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
    model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
    model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.

simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 step: 0.0027.

simulator executeOn: model.
chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {#status -> #I}).
chart plot.

^ simulator -> model
]

{ #category : #'as yet unclassified' }
TestMosquitoScripts >> createModels [

	beforePair := self before.
	beforeSimulator := beforePair key.
	beforeModel := beforePair value.
	self after.
	afterSimulator := Simulation withId: 'MosquitoGillepsie'.
	afterModel := ModelComponent withId: 'Mosquito'.
	(Visualization withId: 'MosquitoDiagramViz') open.	
]

{ #category : #'as yet unclassified' }
TestMosquitoScripts >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
	
]

{ #category : #'as yet unclassified' }
TestMosquitoScripts >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestMosquitoScripts >> testEquivalence [

	self createModels.

	"gillepsie is stochastic -- need reproducible stochastic sim to properly compare"
]
