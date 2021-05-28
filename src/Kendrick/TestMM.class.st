Class {
	#name : #TestMM,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM'
}

{ #category : #tests }
TestMM >> testKEModelHasAName [

| m |
m := KEModel new modelName:'SIR'.
m assert: m modelName equals: 'SIR'
]

{ #category : #tests }
TestMM >> testRIsConvergingToOne [

	| solver system dt beta gamma values stepper maxTime st r |
	dt := 0.001.
	beta := 0.0052.
	gamma := 52.
	maxTime := 0.2.
	system := PMExplicitSystem block: [ :x :t | 
		          | c |
		          c := Array new: 3.
		          c at: 1 put: beta negated * (x at: 1) * (x at: 2).
		          c
			          at: 2
			          put: beta * (x at: 1) * (x at: 2) - (gamma * (x at: 2)).
		          c at: 3 put: gamma * (x at: 2).
		          c ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	st := { 99999. 1. 0 }.
	values := (0.0 to: maxTime by: dt) collect: [ :t | 
		          st := stepper doStep: st time: t stepSize: dt ].
	r := values collect: [ :each | each at: 3 ].
	self
		assert: ((r
				 collect: [ :each | each / 100000 closeTo: 1.0 precision: 0.001 ])
				 isSortedBy: [ :i :j | i ==> j ])
		equals: true
]

{ #category : #tests }
TestMM >> testRIsIncreasing [

	| solver system dt beta gamma values stepper maxTime st  |
	dt := 0.001.
	beta := 0.0052.
	gamma := 52.
	maxTime := 0.2.
	system := PMExplicitSystem block: [ :x :t | 
		          | c |
		          c := Array new: 3.
		          c at: 1 put: beta negated * (x at: 1) * (x at: 2).
		          c
			          at: 2
			          put: beta * (x at: 1) * (x at: 2) - (gamma * (x at: 2)).
		          c at: 3 put: gamma * (x at: 2).
		          c ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	st := { 99999. 1. 0 }.
	values := (0.0 to: maxTime by: dt) collect: [ :t | 
		          st := stepper doStep: st time: t stepSize: dt ].

	self
		assert: (values collect: [ :each | each at: 3 ]) isSorted
		equals: true
]
