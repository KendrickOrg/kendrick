Class {
	#name : #TestMM,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM'
}

{ #category : #tests }
TestMM >> testIIsConvergingToZero [

	| solver system dt beta gamma values stepper maxTime st r max indexMax |
	dt := 0.001.
	beta := 0.0052.
	gamma := 52.
	maxTime := 0.2.
	system := PMExplicitSystem block: [ :v :t | 
		          | c |
		          "S: 1, I: 2, R: 3"
		          c := Array new: 3.
		          c at: 1 put: beta negated * (v at: 1) * (v at: 2).
		          c
			          at: 2
			          put: beta * (v at: 1) * (v at: 2) - (gamma * (v at: 2)).
		          c at: 3 put: gamma * (v at: 2).
		          c ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	st := { 99999. 1. 0 }.
	values := (0.0 to: maxTime by: dt) collect: [ :t | 
		          st := stepper doStep: st time: t stepSize: dt ].
	r := values collect: [ :each | each at: 2 ].

	"Select last monotonous part of the time series"
	max := r max.
	indexMax := r indexOf: max.
	r := r copyFrom: indexMax to: r size.
	self
		assert:
			((r collect: [ :each | each / 100000 closeTo: 0.0 precision: 0.001 ]) 
				 isSortedBy: [ :i :j | i ==> j ])
		equals: true
]

{ #category : #tests }
TestMM >> testRIsConvergingToOne [

	"R is increasing"
	| solver system dt beta gamma values stepper maxTime st r |
	dt := 0.001.
	beta := 0.0052.
	gamma := 52.
	maxTime := 0.2.
	system := PMExplicitSystem block: [ :x :t | 
		          | c |
		          "S: 1, I: 2, R: 3"
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
		assert:
			((r collect: [ :each | each / 100000 closeTo: 1.0 precision: 0.001 ]) 
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

{ #category : #tests }
TestMM >> testSIsConvergingToZero [

	| solver system dt beta gamma values stepper maxTime st r |
	dt := 0.001.
	beta := 0.0052.
	gamma := 52.
	maxTime := 0.2.
	system := PMExplicitSystem block: [ :x :t | 
		          | c |
		          "S: 1, I: 2, R: 3"
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

	r := values collect: [ :each | each at: 1 ].
	self
		assert:
			((r collect: [ :each | each / 100000 closeTo: 0.0 precision: 0.001 ]) 
				 isSortedBy: [ :i :j | i ==> j ])
		equals: true
]
