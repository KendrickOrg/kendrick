Class {
	#name : #K2TransitionTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2TransitionTest >> testTransitionBetween2States [

	| stateA stateB transition |
	stateA := K2State new name: #A.
	stateB := K2State new name: #B.
	transition := K2Transition new
		              from: stateA;
		              to: stateB.
	self assert: transition from equals: stateA.
	self assert: transition to equals: stateB
]
