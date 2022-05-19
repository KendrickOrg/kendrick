"
I'm representing Continuous Time Markov Chain.
"
Class {
	#name : #K2CTMC,
	#superclass : #K2Automaton,
	#instVars : [
		'currentState'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #'instance creation' }
K2CTMC class >> newFromArray: anArray initialState: anInteger [

	self shouldBeImplemented
]

{ #category : #accessing }
K2CTMC >> currentState [
	^ currentState
]

{ #category : #accessing }
K2CTMC >> currentState: aState [

	currentState := aState
]

{ #category : #'as yet unclassified' }
K2CTMC >> initialize [

	super initialize
]
