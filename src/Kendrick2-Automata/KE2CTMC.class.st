"
I'm representing Continuous Time Markov Chain.
"
Class {
	#name : #KE2CTMC,
	#superclass : #Object,
	#instVars : [
		'states',
		'currentState',
		'fromState',
		'toState',
		'rate'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #accessing }
KE2CTMC >> currentState [
	^ currentState
]

{ #category : #accessing }
KE2CTMC >> currentState: aNumber [
	currentState := aNumber
]
