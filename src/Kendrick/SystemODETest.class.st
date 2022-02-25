Class {
	#name : #SystemODETest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM'
}

{ #category : #tests }
SystemODETest >> testVerificationIfTwoMethodsOfExpressionOdeAreEquals [

	|system1 state stepper1 system2 stepper2 stepSize state1 state2 z |
	
system1 := PMExplicitSystem block: [:x :t| 3.0 / (2.0 * t * t) + (x / (2.0 * t))]. 
stepper1 := PMRungeKuttaStepper onSystem: system1. 

system2 := SystemODE new
  initialValue: 0;
  equations:#( x:t = 3.0 / (2.0 * t * t) + (x / (2.0 * t))).
stepper2 := PMRungeKuttaStepper onSystem: system2 .

state := 0.
stepSize := 0.1.
z := 0.

state1 := stepper1 doStep: state time: z stepSize: stepSize.
state2 := stepper2 doStep: state time: z stepSize: stepSize.
"state1:= (PMExplicitSolver new) stepper: stepper1; system: system1; dt: stepSize. 
state2:= (PMExplicitSolver new) stepper: stepper2; system: system2; dt: stepSize. "
self assert: state1 equals: state2.
]
