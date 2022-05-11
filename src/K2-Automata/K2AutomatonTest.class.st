Class {
	#name : #K2AutomatonTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2AutomatonTest >> testANewAutomatonHasNoStatesExample [

	<gtExample>
	| a |
	a := K2Automaton new.
	self assert: a states isEmpty.
	^ a
]

{ #category : #tests }
K2AutomatonTest >> testNewAutomatonHasNoFinalStatesExample [

	<gtExample>
	|a|
	a := K2Automaton new.
	self assert: a finalStates  isEmpty.
	^a
]
