Class {
	#name : #TestMM,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM'
}

{ #category : #tests }
TestMM >> testThanSolvingODEsOfSIRModelWithKEODESystemReturnsSameResultThanWithPMODESystem [
	"The test is inspired by a SIR compartmental model"
	| system1 initialState stepper1 system2 stepper2 stepSize state1 state2 startTime solver1 solver2 endTime beta gamma|
	
	 beta := 0.01.
	 gamma := 0.1.
    stepSize := 1.0.
    startTime := 0.0.
    endTime := 75.0.

    system1 := PMExplicitSystem block: [ :x :t| | c |
           c:= Array new: 3.
			  c at: 1 put: (beta negated) * (x at: 1) * (x at: 2).
	        c at: 2 put: (beta * (x at: 1) * (x at: 2)) - (gamma * (x at: 2)).
			  c at: 3 put: gamma * (x at: 2).
	c].
    stepper1 := PMRungeKuttaStepper onSystem: system1.
    initialState := #(9.0 1.0 0.0).

    system2 := KEODESystem new   
                    at:#beta put: beta;
                    at:#gamma put: gamma;
              equations:
                       {'s:t = (-beta * i * s)'.
                   'i:t = (beta * i * s) - (gamma * i)'.
                'r:t = (gamma * i)'};
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
TestMM >> testWithMultipleEquations [

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

{ #category : #tests }
TestMM >> testWithMultipleEquationsAndParameters [

	"Lorenz equations https://en.wikipedia.org/wiki/Lorenz_system"
	
    | system1 initialState stepper1 system2 stepper2 stepSize state1 state2 startTime solver1 solver2 endTime b sigma r|

    sigma := 10.0.
    r := 28.
    b := 8.0/3.0.
    stepSize := 0.1.
    startTime := 1.0.
    endTime := 10.0.

    system1 := PMExplicitSystem block: [ :x :t| | c |
           c:= Array new: 3.
           c at: 1 put: sigma * ((x at: 2) - (x at: 1)).
           c at: 2 put: r * (x at: 1) - (x at: 2) - ((x at: 1) * (x at: 3)).
           c at: 3 put: (b negated * (x at: 3) + ((x at: 1) * (x at: 2))).
           c].
    stepper1 := PMRungeKuttaStepper onSystem: system1.
    initialState := #(10.0 10.0 10.0).

    system2 := KEODESystem new   
                    at:#sigma put: sigma;
                    at:#b put: b;
                    at:#r put: r;
              equations:
                       {'x:t = sigma * (y - x)'.
                   'y:t = r * x - y - (x * z)'.
                'z:t = (-b * z) + (x * y)'};
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
