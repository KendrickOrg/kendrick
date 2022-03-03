Class {
	#name : #TestMM,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM'
}

{ #category : #tests }
TestMM >> testThanSolvingODEsWithKEODESystemReturnsSameResultThanWithPMODESystem [

	| system1 initialState stepper1 system2 stepper2 stepSize state1 state2 startTime solver1 solver2 endTime |
	system1 := PMExplicitSystem block: [ :x :t | 
		           3.0 / (2.0 * t * t) + (x / (2.0 * t)) ].
	stepper1 := PMRungeKuttaStepper onSystem: system1.
	initialState := #( 0 ).

	system2 := KEODESystem new
		           equations:
			           { 'x:t = 3.0 / ( 2.0 * t * t ) + ( x / ( 2.0 * t ) )' };
		           initialState: initialState.
	stepper2 := PMRungeKuttaStepper onSystem: system2.

	stepSize := 0.1.
	startTime := 1.0.
	endTime := 10.0.

	solver1 := PMExplicitSolver new
		           stepper: stepper1;
		           system: system1;
		           dt: stepSize.
	state1 := solver1
		          solve: system1
		          startState: initialState
		          startTime: startTime
		          endTime: endTime.

	solver2 := PMExplicitSolver new
		           stepper: stepper2;
		           system: system2;
		           dt: stepSize.
	state2 := solver2
		          solve: system2
		          startState: initialState
		          startTime: startTime
		          endTime: endTime.
	self assert: state1 equals: state2
]

{ #category : #tests }
TestMM >> testWithMulitpleEquations [

	"Lorenz equations https://en.wikipedia.org/wiki/Lorenz_system"

	| system1 initialState stepper1 system2 stepper2 stepSize state1 state2 startTime solver1 solver2 endTime |

	stepSize := 0.1.
	startTime := 1.0.
	endTime := 10.0.

	system1 := PMExplicitSystem block: [ :x :t | 
		           | c |
		           c := Array new: 3.
		           c at: 1 put: 10.0 * ((x at: 2) - (x at: 1)).
		           c
			           at: 2
			           put:
			           28 * (x at: 1) - (x at: 2) - ((x at: 1) * (x at: 3)).
		           c
			           at: 3
			           put: (8.0 / 3.0) negated * (x at: 3) + ((x at: 1) * (x at: 2)).
		           c ].
	stepper1 := PMRungeKuttaStepper onSystem: system1.
	initialState := #( 10.0 10.0 10.0 ).

	system2 := KEODESystem new
		           equations:
			           { 'x:t = 10.0 * (y - x)'. 'y:t = 28.0 * x - y - (x * z)'.
			           'z:t = (-(8.0 / 3.0) * z) + (x * y)' };
		           initialState: initialState.
	stepper2 := PMRungeKuttaStepper onSystem: system2.

	solver1 := PMExplicitSolver new
		           stepper: stepper1;
		           system: system1;
		           dt: stepSize.
	state1 := solver1
		          solve: system1
		          startState: initialState
		          startTime: startTime
		          endTime: endTime.

	solver2 := PMExplicitSolver new
		           stepper: stepper2;
		           system: system2;
		           dt: stepSize.
	state2 := solver2
		          solve: system2
		          startState: initialState
		          startTime: startTime
		          endTime: endTime.

	self assert: state1 equals: state2
]
