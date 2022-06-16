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

{ #category : #adding }
K2Event >> addOneIndividualTo: aState [
	toState := aState
]

{ #category : #accessing }
K2Event >> events [ 
	events isNil ifTrue:[events := Array new].
	^events
]

{ #category : #accessing }
K2Event >> events: anArray [ 
	events := anArray 
]

{ #category : #accessing }
K2Event >> fromState [
	^ fromState
]

{ #category : #accessing }
K2Event >> fromState: aState [
	fromState := aState
]

{ #category : #accessing }
K2Event >> rate [
	^ rate
]

{ #category : #accessing }
K2Event >> rate: aRate [
	rate := aRate
]

{ #category : #removing }
K2Event >> removeOneIndividualFrom: aState [
	fromState := aState
]

{ #category : #accessing }
K2Event >> toState [
	^ toState
]

{ #category : #accessing }
K2Event >> toState: aState [
	toState := aState
]
