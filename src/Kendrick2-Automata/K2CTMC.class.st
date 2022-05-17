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
K2CTMC class >> newFromMatrix: matrix [
| ctmc |
ctmc := K2CTMC new.

(1 to: matrix columnCount) do: [ :e |
		|s|
		s := K2CTMCState new.
		s name: ((ctmc  states size + 1) asString).
		ctmc states add: s.
		].
	
	matrix withIndicesDo: [ :e :i :j | ctmc fromState: i toAnotherState: j probability: e ].
	ctmc  currentState: (ctmc states first).
	^ ctmc
]

{ #category : #'instance creation' }
K2CTMC class >> newFromMatrix: matrix withStates: aCollectionOfStates [
| ctmc |

(aCollectionOfStates size = matrix rowCount ) ifFalse: [ K2StateSizeDoesNotMachMatrixSizeExceptions new signal. ] .

ctmc := K2CTMC new.

aCollectionOfStates do: [ :e |
		ctmc states add: e.
		].
	matrix withIndicesDo: [ :e :i :j | ctmc fromState: i toAnotherState: j  probability: e ].
	ctmc currentState: (ctmc states first).
	^ctmc
]

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

{ #category : #initialization }
K2CTMC >> initialize [
	super initialize.
	states := OrderedCollection new.
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
K2CTMC >> states: aCollectionOfStates [

	states := aCollectionOfStates
]

{ #category : #'as yet unclassified' }
K2CTMC >> step [

"Next step is determined based on transition probabilities of the current state."
	currentState := currentState nextState
]
