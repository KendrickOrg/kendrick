Class {
	#name : #K2CMTCTransitionTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2CMTCTransitionTest >> testNewCTMCHasNoTransitions [

	<gtExample>
	|transition|
	transition := K2CTMCTransition new.
	self assert: transition from isNil.
	self assert: transition to isNil.
	^transition
]
