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
K2CTMC class >> newFromArray: anArray [
	|automaton |	
automaton := K2CTMC new.

(1 to: anArray size) do: [ :e |
		|state|
		state := K2CTMCState new.
		state name: ((automaton  states size + 1) asString).
		automaton states add: state.
		].

	automaton currentState: (automaton states first).
	^ automaton 
]

{ #category : #'instance creation' }
K2CTMC class >> newFromArray: anArray initialState: anInteger [

	^ (self new)
	initialState: anInteger
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

	super initialize.
	states := OrderedCollection new.
]

{ #category : #accessing }
K2CTMC >> states [
	^states
]

{ #category : #accessing }
K2CTMC >> states: anObject [
  states:= anObject 
]

{ #category : #'as yet unclassified' }
K2CTMC >> step [

	currentState := 1.
	^ currentState 
]
