Class {
	#name : #K2TransitionTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2TransitionTest >> testTransitionBetween2States [

	| stateA stateB transition |
	stateA := K2State named: #A.
	stateB := K2State named: #B.
	transition := (K2Transition
		              named: #t) from: stateA;
		              to: stateB.
	self assert: transition from equals: stateA.
	self assert: transition to equals: stateB
]
