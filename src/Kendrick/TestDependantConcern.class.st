Class {
	#name : #TestDependantConcern,
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

{ #category : #accessing }
TestDependantConcern >> after [

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
		
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda sigma gamma mu);
	mu: 0.0000365;
	gamma: 0.25;
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
	).

KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	sigma: 0.5;
	delay: #(sigma , S -- lambda --> I  , E).
	
Composition OneSpatialCombo
	model: 'Spatial';
	model: 'SEIR';
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
TestDependantConcern >> afterBench [

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
		
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda sigma gamma mu);
	mu: 0.0000365;
	gamma: 0.25;
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
	).

KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	sigma: 0.5;
	delay: #(sigma , S -- lambda --> I  , E).
	
Composition OneSpatialCombo
	model: 'Spatial';
	model: 'SEIR';
	beta_patch: #(0.75 0.5 0.5 0.5 0.5);
	N: #(patch);
	lambda: #(beta*I_patch/N); "check how this should work"
	S_patch: #(900 1000 1000 1000 1000);
	I_patch: #(100 0 0 0 0).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'OneSpatialCombo';
	from: 0; 
	to: 500; 
	step: 1;
	init;
	execute.
]

{ #category : #accessing }
TestDependantConcern >> before [

|model sirConcern eConcern spatialConcern simulator db|
sirConcern := KEModelPart new.
sirConcern attributes: {#status->#(#S #I #R)}.
sirConcern addParameters: {#lambda. #gamma}.
sirConcern
    addTransitionFrom: {#status -> #S}
    to: {#status -> #I}
    probability: [ :aModel | aModel atParameter: #lambda ].
sirConcern 
    addTransitionFrom: {#status -> #I}
    to: {#status -> #R} 
    probability: [ :aModel | aModel atParameter: #gamma ].

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

model := KEModel new.
model population: (KEPopulation size: 5000).
model integrate: spatialConcern.
model integrate: sirConcern.

eConcern := KEModelPart dependOn: sirConcern.
eConcern atAttribute: #status add: #E.
eConcern 
    removeTransitionFrom: { #status->#S } 
    to: { #status->#I }.
eConcern 
    addTransitionFrom: { #status->#S } 
    to: { #status->#E } 
    probability: [ :aModel| aModel atParameter: #lambda ].
eConcern 
    addTransitionFrom: { #status->#E } 
    to: { #status->#I } 
    probability: [ :aModel| aModel atParameter: #sigma ].
eConcern 
    addTransitionFrom: { #status->#E } 
    to: #empty 
    probability: [ :aModel| aModel atParameter: #mu ].
eConcern addParameter: #sigma.
model integrate: eConcern.

model atParameter: #beta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #patch.
        c = 1 ifTrue: [ val := 0.75 ] ifFalse: [ val := 0.5 ].
        val 
    ].
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
    tmp add: (simulator timeSeriesOutputsAt: {#status -> #I. #patch -> 1}).
    tmp add: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 2}).
    tmp add: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 3}).
    tmp add: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 4}).
    tmp add: (simulator timeSeriesOutputsAt: {#status -> #I.#patch -> 5}).
    tmp] value.
    db legends: { 'patch 1'. 'patch 2'. 'patch 3'. 'patch 4'. 'patch 5'}.
    db legendTitle: 'Infectious'.
    db xLabel: 'Time (days)'.
    db open.

	^ {simulator . model . db}
]

{ #category : #'as yet unclassified' }
TestDependantConcern >> beforeBench [

|model sirConcern eConcern spatialConcern simulator db|
sirConcern := KEModelPart new.
sirConcern attributes: {#status->#(#S #I #R)}.
sirConcern addParameters: {#lambda. #gamma}.
sirConcern
    addTransitionFrom: {#status -> #S}
    to: {#status -> #I}
    probability: [ :aModel | aModel atParameter: #lambda ].
sirConcern 
    addTransitionFrom: {#status -> #I} 
    to: {#status -> #R}
    probability: [ :aModel | aModel atParameter: #gamma ].

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

model := KEModel new.
model population: (KEPopulation size: 5000).
model integrate: spatialConcern.
model integrate: sirConcern.

eConcern := KEModelPart dependOn: sirConcern.
eConcern atAttribute: #status add: #E.
eConcern 
    removeTransitionFrom: { #status->#S } 
    to: { #status->#I }.
eConcern 
    addTransitionFrom: { #status->#S } 
    to: { #status->#E } 
    probability: [ :aModel| aModel atParameter: #lambda ].
eConcern 
    addTransitionFrom: { #status->#E } 
    to: { #status->#I } 
    probability: [ :aModel| aModel atParameter: #sigma ].
eConcern 
    addTransitionFrom: { #status->#E } 
    to: #empty 
    probability: [ :aModel| aModel atParameter: #mu ].
eConcern addParameter: #sigma.
model integrate: eConcern.

model atParameter: #beta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #patch.
        c = 1 ifTrue: [ val := 0.75 ] ifFalse: [ val := 0.5 ].
        val 
    ].
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
    simulator executeOn: model
]

{ #category : #benchmarking }
TestDependantConcern >> bench [

	| before after |
	
	before := self benchmark: [self beforeBench] times: 100.
	after := self benchmark: [self afterBench] times: 100.
	
	Transcript 
		show: before; cr; 
		show: after; cr; 
		show: (after at: 1) / (before at: 1); cr; cr.
	
]

{ #category : #benchmarking }
TestDependantConcern >> benchmark: aBlock times: anInteger [

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
TestDependantConcern >> createModels [

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

{ #category : #initialization }
TestDependantConcern >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
]

{ #category : #running }
TestDependantConcern >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #tests }
TestDependantConcern >> testEquivalence [


	| resultsBefore resultsAfter |
	self createModels.

	resultsBefore := (beforeDiagram data collect: [ :ts | ts max floor ]) collect: [: each| each values ].
	resultsAfter := (afterDiagram data collect: [ :ts | ts max floor ]) collect: [: each| each values ].
	self assert: resultsBefore = resultsAfter
	
]
