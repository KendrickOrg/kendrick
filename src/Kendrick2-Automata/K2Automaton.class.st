"
I'm the abstract class of Automaton.
An abstract Automaton is defined with a collection of states and an initial state.
"
Class {
	#name : #K2Automaton,
	#superclass : #Object,
	#instVars : [
		'name',
		'states',
		'initialState'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #stepping }
K2Automaton >> step [

	"Performs a single step on the automaton changing its current state."

	self subclassResponsibility
]
