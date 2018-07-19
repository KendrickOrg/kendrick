"
A KESimulator is an abstract class for simulator of system. All different simulators shoud extend this class and implement the method executeOn:

Instance Variables
	algorithm:	<Symbol>
	data:		<Dictionary<Symbol><KETimeSeries>>
	model:		<KEModel>
	step:		<Number>
	tMax:		<Number>
	tMin:		<Number>

algorithm
	- xxxxx

data
	- xxxxx

model
	- xxxxx

adapters
	- A list of adapters added into model. Each adapter is responsible for a particular task, related to the specific aspect of domain

step
	- xxxxx

tMax
	- xxxxx

tMin
	- xxxxx

"
Class {
	#name : #KESimulator,
	#superclass : #KEEntity,
	#instVars : [
		'model',
		'tMin',
		'tMax',
		'step',
		'algorithm',
		'timeSeriesOutputs'
	],
	#category : 'Kendrick-Semantic-Model-Core'
}

{ #category : #meta }
KESimulator class >> annotation [
	<MSEClass: #Simulator super: #KEEntity >
	<package: #KE>
	^ self
]

{ #category : #'as yet unclassified' }
KESimulator class >> deterministicSolvers [
	|algos|
	algos := Dictionary new.
	algos at: #AB2 put: #AB2Stepper; at: #AB3 put: #AB3Stepper; at: #AB4 put: #AB4Stepper; at: #AM3 put: #AM3Stepper; at: #AM4 put: #AM4Stepper; at: #BDF2 put: #BDF2Stepper; at: #BDF3 put: #BDF3Stepper; at: #BDF4 put: #BDF4Stepper; at: #BeckwardEuler put: #ImplicitStepper; at: #Euler put: #ExplicitStepper; at: #Heun put: #HeunStepper; at: #ImplicitMidPoint put: #ImplicitMidpointStepper; at: #Midpoint put: #MidpointStepper; at: #RungeKutta put: #RungeKuttaStepper; at: #Trapezoid put: #TrapezoidStepper.
	^ algos
]

{ #category : #meta }
KESimulator class >> new: algorithm from: tMin to: tMax step: step [
	(self deterministicSolvers keys includes: algorithm) ifTrue: 
		[ ^ (KEDeterministicSimulator new) tMin: tMin; tMax: tMax; step: step; algorithm: (self deterministicSolvers at: algorithm) ].
	algorithm = #Gillespie ifTrue: 
		[ ^ (KEGillespieSimulator new) tMin: tMin; tMax: tMax; step: step ].
	"algorithm = #GPUGillespie ifTrue: 
		[ ^ (KEGPUStochasticSimulator new) tMin: tMin; tMax: tMax; step: step ]."
	algorithm = #TauLeap ifTrue: 
		[ ^ (KETauLeapSimulator new) tMin: tMin; tMax: tMax; step: step ].
	algorithm = #IBM ifTrue:
		[ ^ (KEIndividualBasedSimulator new) tMin: tMin; tMax: tMax; step: step ]
]

{ #category : #meta }
KESimulator class >> passType: type [
	"Add other algorithms following 3 categories: Deterministic | Stochastic | IBM"
	((type = #IBMDiscreteTime) | (type = #IBMDiscreteSpace)) ifTrue: [ ^ KEIndividualBasedSimulator ].
	(type = #RK4) ifTrue: [ ^ KEDeterministicSimulator ].
	((type = #GillespieDirect) | (type = #GPUGillespie)| (type = #ExplicitTauLeap) | (type = #AdaptiveTauLeap)) ifTrue: [ ^ KEStochasticSimulator ].
]

{ #category : #accessing }
KESimulator >> algorithm [
	<MSEProperty: #algorithm type: #String>
	^ algorithm
]

{ #category : #accessing }
KESimulator >> algorithm: anObject [
	algorithm := anObject
]

{ #category : #public }
KESimulator >> executeOn: aModel [
	self model: aModel.
	self initializeTimeSeriesOutputs
]

{ #category : #initialization }
KESimulator >> initializeTimeSeriesOutputs [
	timeSeriesOutputs := OrderedCollection new.
	model population compartments
		keysDo: [ :each | timeSeriesOutputs add: (KETimeSeries new compartment: each) ]
]

{ #category : #accessing }
KESimulator >> model [
	<MSEProperty: #model type: #KEModel>
	^ model
]

{ #category : #accessing }
KESimulator >> model: anObject [
	model := anObject
]

{ #category : #'as yet unclassified' }
KESimulator >> saveCompartmentsValueAtTime: t [
	model population compartments
		keysAndValuesDo: [ :k :v | 
			| ts |
			ts := timeSeriesOutputs detect: [ :e | e compartment = k ].
			ts add: v atIndex: t ]
]

{ #category : #accessing }
KESimulator >> step [
	<MSEProperty: #step type: #Number>
	^ step
]

{ #category : #accessing }
KESimulator >> step: aNumber [
	step := aNumber
]

{ #category : #accessing }
KESimulator >> tMax [
	<MSEProperty: #tMax type: #Number>
	^ tMax
]

{ #category : #accessing }
KESimulator >> tMax: aNumber [
	tMax := aNumber
]

{ #category : #accessing }
KESimulator >> tMin [
	<MSEProperty: #tMin type: #Number>
	^ tMin
]

{ #category : #accessing }
KESimulator >> tMin: aNumber [
	tMin := aNumber
]

{ #category : #accessing }
KESimulator >> timeSeriesOutputs [
	^ timeSeriesOutputs 
]

{ #category : #accessing }
KESimulator >> timeSeriesOutputsAt: aCompartmentName [
	| association |
	association := aCompartmentName.
	aCompartmentName isString ifTrue: [ association := (STON fromString: aCompartmentName) associations ].
	^ self timeSeriesOutputs select: [ :t | t compartment associations includesAll: association ]
]
