Class {
	#name : #K2FSMTransitionTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2FSMTransitionTest >> testTransitionBetween2States [

	| stateA stateB transition |
	stateA := K2FSMState2 named: #A.
	stateB := K2FSMState2 named: #B.
	transition := (K2FSMTransition
		              named: #t) from: stateA;
		              to: stateB.
	self assert: transition from equals: stateA.
	self assert: transition to equals: stateB
]
