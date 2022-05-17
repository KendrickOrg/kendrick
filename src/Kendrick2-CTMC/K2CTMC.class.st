"
The principal class of `CTMC`
"
Class {
	#name : #K2CTMC,
	#superclass : #Object,
	#instVars : [
		'states',
		'currentState'
	],
	#category : #'Kendrick2-CTMC-Core'
}

{ #category : #accessing }
K2CTMC >> currentState [
	^ currentState
]

{ #category : #accessing }
K2CTMC >> currentState: anObject [
	currentState := anObject
]

{ #category : #'instance creation' }
K2CTMC >> fromState: anInteger toAnotherState: anInteger2 probability: aNumber [ 
	|transition|
	transition := K2CTMCTransition new.
	transition from: (states at: anInteger);to: (states at: anInteger2 );probability: aNumber.
	(states at: anInteger) transitionArray add: transition .
]

{ #category : #'as yet unclassified' }
K2CTMC >> goToNextState [
	currentState := currentState nextState.
]

{ #category : #'as yet unclassified' }
K2CTMC >> probabilityFrom: aFromStateIndex to: aToStateIndex [

	^ ((self states at: aFromStateIndex ) transitionArray at: aToStateIndex ) probability .
]

{ #category : #accessing }
K2CTMC >> states [
	^ states
]

{ #category : #accessing }
K2CTMC >> states: anObject [
	states := anObject
]
