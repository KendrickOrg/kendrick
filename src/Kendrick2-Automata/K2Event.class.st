"
This class is responsible for managing events that can be triggered when an individual's state changes.
"
Class {
	#name : #K2Event,
	#superclass : #Object,
	#instVars : [
		'events',
		'stateName',
		'fromState',
		'rate',
		'toState'
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