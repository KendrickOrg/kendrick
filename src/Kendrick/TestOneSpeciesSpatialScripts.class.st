Class {
	#name : #TestOneSpeciesSpatialScripts,
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
TestOneSpeciesSpatialScripts >> after [

ModelComponent OneSpeciesSpatial	
	population: 5000.

KendrickModel Spatial
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
		
KendrickModel Epidemiological
	attribute: #(status -> S  E  I  R);
	parameters: #(beta lambda sigma gamma v mu);
	v: 0.00274;
	mu: 0.0000365;
	sigma: 0.5;
	gamma: 0.25;
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> E.
		E -- sigma --> I.
		I -- gamma --> R.
		R -- v --> S.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).
		
Composition OneSpatialCombo
	model: 'Spatial';
	model: 'Epidemiological';
	beta_patch: #(0.75 0.5 0.5 0.5 0.5);
	N: #(patch);
	lambda: #(beta*I_patch/N); "check how this should work"
	S_patch: #(900 1000 1000 1000 1000);
	I_patch: #(100 0 0 0 0).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'OneSpatialCombo';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	for: 'SpatialRungeKutta';
	data: #(I_patch);
	legends: #('patch 1' 'patch 2' 'patch 3' 'patch 4' 'patch 5');
	legendTitle: 'Infectious';
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestOneSpeciesSpatialScripts >> before [

| spatialConcern seirsConcern model simulator db |
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

seirsConcern := KEModelPart new.
 seirsConcern attributes: {#status->#(#S #E #I #R)}.
 seirsConcern addParameters: { #beta. #gamma. #mu. #sigma. #v }.
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
     probability: [ :aModel | aModel atParameter: #v ].
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

     model := KEModel new.
 model population: (KEPopulation size: 5000).
 model integrate: spatialConcern.
 model integrate: seirsConcern.

model atParameter: #beta assignValue: [ :aModel| |c val| 
     c := aModel currentCompartment at: #patch.
     c = 1 ifTrue: [ val := 0.75 ] ifFalse: [ val := 0.5 ].
     val 
 ].
 model atParameter: #v assignValue: 0.00274.
 model atParameter: #mu assignValue: 0.0000365.
 model atParameter: #sigma assignValue: 0.5.
 model atParameter: #gamma assignValue: 0.25.
 model atParameter: #N assignValue: [ :aModel| |c| 
     c := aModel currentCompartment at: #patch.
     aModel sizeOfPopulation: c
     ].
 model atParameter: #rho assignValue: 0.03. 
 model atParameter: #lambda assignValue: [ :aModel| |c|
     c := aModel currentCompartment at: #patch.
     (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)
 ].

model atCompartment: { #status->#S. #patch->1 } put: 900 atOthersPut: 0.
 model atCompartment: { #status->#I. #patch->1 } put: 100.
 model atCompartment: { #status->#S. #patch->2 } put: 1000.
 model atCompartment: { #status->#S. #patch->3 } put: 1000.
 model atCompartment: { #status->#S. #patch->4 } put: 1000.
 model atCompartment: { #status->#S. #patch->5 } put: 1000.

simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
 simulator executeOn: model.
 db := KEDiagramBuilder new.
 db data: [|tmp| tmp := OrderedCollection new.
 tmp addAll: (simulator timeSeriesOutputsAt: {#status ->#I.#patch -> 1}).
 tmp addAll: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 2}).
 tmp addAll: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 3}).
 tmp addAll: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 4}).
 tmp addAll: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 5}).
 tmp] value.
 db legends: { 'patch 1'. 'patch 2'. 'patch 3'. 'patch 4'. 'patch 5'}.
 db legendTitle: 'Infectious'.
 db xLabel: 'Time (days)'.
 db open.

	^ {simulator . model . db}
]

{ #category : #'as yet unclassified' }
TestOneSpeciesSpatialScripts >> createModels [

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'OneSpeciesSpatial'.
	afterDiagram := (Visualization withId: 'SpatialDiagramViz') open.	
]

{ #category : #'as yet unclassified' }
TestOneSpeciesSpatialScripts >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
]

{ #category : #'as yet unclassified' }
TestOneSpeciesSpatialScripts >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestOneSpeciesSpatialScripts >> testEquivalence [


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
