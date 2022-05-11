"
We create a class `K2Automaton` with 4 instance variables `initialState`, `finalState`, `states` and `transitions` representing respectively the initial state, the possible final states, the states and the transitions of the automaton
"
Class {
	#name : #K2Automaton,
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
K2Automaton >> finalStates [
	^finalStates 
]

{ #category : #accessing }
K2Automaton >> initialState [ 
	^initialState 
]

{ #category : #accessing }
K2Automaton >> initialize [ 
states := OrderedCollection new.
transitions := OrderedCollection new.
initialState := OrderedCollection new.
finalStates := OrderedCollection new
]

{ #category : #accessing }
K2Automaton >> states [ 
^states
]

{ #category : #accessing }
K2Automaton >> transitions [
	^transitions 
]
