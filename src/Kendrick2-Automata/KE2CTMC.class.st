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

{ #category : #accessing }
KE2CTMC >> fromState [
	^ fromState
]

{ #category : #accessing }
KE2CTMC >> fromState: aNumber [
	fromState := aNumber 
]

{ #category : #'as yet unclassified' }
KE2CTMC >> fromState: anInteger toState: anInteger2 rate: aNumberOrExpression [
	|transition|
	transition := KE2CTMC new.
	transition 
				fromState: (self fromState:  anInteger - 1);
				toState:  (self toState:  anInteger2 + 1);
				rate: (self rate: aNumberOrExpression).

]

{ #category : #initialization }
KE2CTMC >> initialize [
	super initialize.
	states := OrderedCollection new.
	currentState := OrderedCollection new.
	self fromState: 0.
	self toState: 0.


]

{ #category : #accessing }
KE2CTMC >> rate [
	^rate
]

{ #category : #accessing }
KE2CTMC >> rate: aBlockOrAnExpressionOrAnNumber [
	
	|prob|
	prob := aBlockOrAnExpressionOrAnNumber.
	aBlockOrAnExpressionOrAnNumber isString ifTrue: [ prob := aBlockOrAnExpressionOrAnNumber parseAsAnExpression ].
	rate := prob 
]

{ #category : #accessing }
KE2CTMC >> toState [
	^ toState
]

{ #category : #accessing }
KE2CTMC >> toState: aNumber [
	toState := aNumber 
]
