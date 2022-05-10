Class {
	#name : #K2Automaton,
	#superclass : #Object,
	#instVars : [
		'states'
	],
	#category : #'K2-Automata'
}

{ #category : #accessing }
K2Automaton >> initialize [ 
states := OrderedCollection new
]

{ #category : #accessing }
K2Automaton >> states [ 
^states
]
