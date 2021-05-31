"
A KEDeterministicSimulator is the deterministic simulation of an epidemiological model.

"
Class {
	#name : #KEDeterministicSimulator,
	#superclass : #KESimulator,
	#instVars : [
		'stepper',
		'equations',
		'algorithm'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #accessing }
KEDeterministicSimulator >> algorithm [
	^ algorithm
]

{ #category : #accessing }
KEDeterministicSimulator >> algorithm: aSymbol [
	algorithm := aSymbol
]

{ #category : #public }
KEDeterministicSimulator >> executeOn: aModel [

	"Ask a model its equations then solve them with an ODE solver"

	| st ks system c |
	super executeOn: aModel.
	model transitionsToEquations.
	equations := model equations.
	system := PMExplicitSystem block: [ :x :t | 
		          | i |
		          i := 1.
		          "Create an array the size of model's compartments size"
		          c := Array new: model population compartments size.

		          "Populate compartments cardinalities with x values"
		          model population compartments keysDo: [ :k | 
			          model population compartments at: k put: (x at: i).
			          i := i + 1 ].

		          i := 1.
		          model population compartments keysDo: [ :k | 
			          | tmp |
			          (equations at: k) isEmpty
				          ifTrue: [ tmp := 0 ]
				          ifFalse: [ 
					          tmp := ((equations at: k) collect: [ :e | 
						                  | prob |
						                  ((e at: 1) from at: #status) = #empty
							                  ifTrue: [ 
							                  model currentCompartment: (e at: 1) to ]
							                  ifFalse: [ 
							                  model currentCompartment: (e at: 1) from ].
						                  model nextCompartment: (e at: 1) to.
						                  prob := ((e at: 1) probability value: model)
							                          abs.
						                  (e at: 2) * prob
						                  * (model atCompartment: (e at: 1) from) ]) sum ].
			          c at: i put: tmp.
			          i := i + 1 ].
		          c ].
	self stepper: (self algorithm onSystem: system).
	st := model population compartments values.
	ks := model population compartments keys.
	(tMin to: tMax by: step) do: [ :t | 
		self saveCompartmentsValueAtTime: t.
		model t: t.
		st := stepper doStep: st time: t stepSize: step.
		1 to: ks size do: [ :i | 
		model population compartments at: (ks at: i) put: (st at: i) ] ]
]

{ #category : #SergeStinckwich }
KEDeterministicSimulator >> executeOnWithKEEquations: aModel [

	"Ask a model its equations then solve them with an ODE solver"

	| st ks system result |
	super executeOn: aModel.
	equations := model equations.
	system := PMExplicitSystem block: [ :v :t | 
					 result := equations collect: [ :each |each evaluateWithModel: aModel ].
					result
		].

	self stepper: (self algorithm onSystem: system).
	st := model population compartments values.
	ks := model population compartments keys.
	
	(tMin to: tMax by: step) do: [ :t | 
		self saveCompartmentsValueAtTime: t.
		model t: t.
		st := stepper doStep: st time: t stepSize: step.
		self halt.
		1 to: ks size do: [ :i | 
			self halt.
		model population compartments at: (ks at: i) put: (st at: i) ] ]
]

{ #category : #accessing }
KEDeterministicSimulator >> stepper [
	^ stepper
]

{ #category : #accessing }
KEDeterministicSimulator >> stepper: aStepper [
	stepper := aStepper
]
