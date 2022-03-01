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
	initialState := 0.

	system2 := KEODESystem new
		           initialState: initialState;
		           equation:
			           'x:t = 3.0 / ( 2.0 * t * t ) + ( x / ( 2.0 * t ) ) )'.
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
