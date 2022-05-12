"
I represent a finite state automaton defined as a set of states and transitions.
One of my state is an initial state and a subset are final states.

"
Class {
	#name : #K2FSMAutomaton,
	#superclass : #Object,
	#instVars : [
		'initialState',
		'finalStates',
		'states',
		'transitions'
	],
	#category : #'K2-Automata'
}

{ #category : #accessing }
K2FSMAutomaton >> finalStates [
	^finalStates 
]

{ #category : #accessing }
K2FSMAutomaton >> initialState [ 
	^initialState 
]

{ #category : #accessing }
K2FSMAutomaton >> initialize [ 
states := OrderedCollection new.
transitions := OrderedCollection new.
initialState := OrderedCollection new.
finalStates := OrderedCollection new
]

{ #category : #accessing }
K2FSMAutomaton >> states [ 
^states
]

{ #category : #accessing }
K2FSMAutomaton >> transitions [
	^transitions 
]
