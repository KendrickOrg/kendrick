Class {
	#name : #K2AutomatonTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2AutomatonTest >> testANewAutomatonHasNoStates [

	| a |
	a := K2Automaton new.
	self assert: a states isEmpty
]
