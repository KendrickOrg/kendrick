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
		'timeSeriesOutputs'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #'as yet unclassified' }
KESimulator class >> deterministicSolvers [
	| algorithms |
	algorithms := Dictionary new.
	algorithms
		at: #AB2 put: PMAB2Stepper;
		at: #AB3 put: PMAB3Stepper;
		at: #AB4 put: PMAB4Stepper;
		at: #AM3 put: PMAM3Stepper;
		at: #AM4 put: PMAM4Stepper;
		at: #BDF2 put: PMBDF2Stepper;
		at: #BDF3 put: PMBDF3Stepper;
		at: #BDF4 put: PMBDF4Stepper;
		at: #BeckwardEuler put: PMImplicitStepper;
		at: #Euler put: PMExplicitStepper;
		at: #Heun put: PMHeunStepper;
		at: #ImplicitMidPoint put: PMImplicitMidpointStepper;
		at: #Midpoint put: PMMidpointStepper;
		at: #RungeKutta put: PMRungeKuttaStepper;
		at: #Trapezoid put: PMTrapezoidStepper.
	^ algorithms
]

{ #category : #meta }
KESimulator class >> new: algorithm from: tMin to: tMax step: step [
	(self deterministicSolvers keys includes: algorithm)
		ifTrue: [ ^ KEDeterministicSimulator new
				tMin: tMin;
				tMax: tMax;
				step: step;
				algorithm: (self deterministicSolvers at: algorithm) ].
	algorithm = #Gillespie
		ifTrue: [ ^ KEGillespieSimulator new
				tMin: tMin;
				tMax: tMax;
				step: step ].
	algorithm = #TauLeap
		ifTrue: [ ^ KETauLeapSimulator new
				tMin: tMin;
				tMax: tMax;
				step: step ].
	algorithm = #IBM
		ifTrue: [ ^ KEIndividualBasedSimulator new
				tMin: tMin;
				tMax: tMax;
				step: step ]
]

{ #category : #public }
KESimulator >> executeOn: aModel [
	self model: aModel.
	self initializeTimeSeriesOutputs
]

{ #category : #initialization }
KESimulator >> initializeTimeSeriesOutputs [
	"Initialize timeSeriesOutputs with a DataFrame"

	| columnNames |
	columnNames := (((model population compartments keysDo: [ :each | each ]) keys) asArray) collect: [: each|each associations ].
	timeSeriesOutputs := DataFrame withColumnNames: columnNames
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
	| ds values |
	values := (model population compartments valuesDo: [ :each | each ]) values.
	ds := DataSeries withValues: values name: t.
	timeSeriesOutputs add: ds
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
	"Select from the DataFrame timeSeriesOutputs rows that includes aCompartmentName"

	| names |
	names := timeSeriesOutputs columnNames
		select: [ :each | each includesAll: aCompartmentName ].
	^ timeSeriesOutputs columns: names
]
