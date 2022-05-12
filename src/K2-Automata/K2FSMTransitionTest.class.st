Class {
	#name : #K2FSMTransitionTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2FSMTransitionTest >> testTransitionBetween2States [

	| stateA stateB transition |
	stateA := K2FSMState named: #A.
	stateB := K2FSMState named: #B.
	transition := (K2FSMTransition
		              named: #t) from: stateA;
		              to: stateB.
	self assert: transition from equals: stateA.
	self assert: transition to equals: stateB
]
