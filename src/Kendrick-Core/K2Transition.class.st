Class {
	#name : #K2Transition,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'probability'
	],
	#category : #'Kendrick-Core-MM2'
}

{ #category : #'instance creation' }
K2Transition class >> from: firstState to: secondState probability: aRate [
	^ self new
		from: firstState ;
		to: secondState ;
		probability: aRate
]

{ #category : #comparing }
K2Transition >> = aTransition [
	^ (from = aTransition from) & (to = aTransition to) & (probability = aTransition probability)
]

{ #category : #accessing }
K2Transition >> from [
	^ from
]

{ #category : #accessing }
K2Transition >> from: aState [
	
	| reader |
	aState isDictionary ifTrue: [ ^ from  := aState ].
		aState = #empty
		ifTrue: [ ^ self from: {(#aState -> #empty)} ].
	aState isArray ifTrue: [ 
		^ from := Dictionary newFrom: aState ].
	(reader := STONReader on: aState readStream) 
		allowComplexMapKeys: true.
	^ from := reader next
]

{ #category : #printing }
K2Transition >> printOn: aStream [
	| initial  final |
	initial := from isSymbol
		ifTrue: [ from asString ]
		ifFalse: [ from associations asString ].
	final := to isSymbol
		ifTrue: [ to asString ]
		ifFalse: [ to associations asString ].
	aStream
		nextPutAll: 'From: ';
		nextPutAll: initial;
		nextPutAll: ' To: ';
		nextPutAll: final.
]

{ #category : #accessing }
K2Transition >> probability [
	^ probability 
]

{ #category : #accessing }
K2Transition >> probability: aRate [
	|prob|
	prob := aRate.
	aRate isString ifTrue: [ prob := aRate parseAsAnExpression ].
	probability := prob 
]

{ #category : #accessing }
K2Transition >> to [
	^to 
]

{ #category : #accessing }
K2Transition >> to: aState [
	
	| reader |
	aState isDictionary ifTrue: [ ^ to  := aState  ].
		aState  = #empty ifTrue: [ ^ self to: { #aState -> #empty } ].
	aState  isArray ifTrue: [ 
		^ to := Dictionary newFrom: aState ].
	(reader := STONReader on: aState readStream) 
		allowComplexMapKeys: true.
	^ to := reader next
]
