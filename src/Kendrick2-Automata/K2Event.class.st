"
Class responsible for creating events
"
Class {
	#name : #K2Event,
	#superclass : #Object,
	#instVars : [
		'events',
		'stateName'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #accessing }
K2Event >> events [
	events isNil ifTrue:[events := Array new].
	^events
]

{ #category : #accessing }
K2Event >> events: anArray [
	events := anArray
]
