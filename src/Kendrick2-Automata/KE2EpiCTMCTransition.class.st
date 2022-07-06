"
Class to transition of EpiCTMC.
"
Class {
	#name : #KE2EpiCTMCTransition,
	#superclass : #Object,
	#instVars : [
		'fromState',
		'toState',
		'rate'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #'instance creation' }
KE2EpiCTMCTransition class >> fromState: firstState toState: secondState rate: aBlockOrAnExpressionOrAnNumber [
	^ self new
		fromState: firstState ;
		toState: secondState ;
		rate: aBlockOrAnExpressionOrAnNumber
]

{ #category : #accessing }
KE2EpiCTMCTransition >> executeOn: model times: times [
	(fromState at: #status) = #empty
		ifFalse: [ | old new |
			old := model population states at: fromState.
			new := old - times.
			new := new max: 0.
			model population states at: fromState put: new ].
	(toState at: #status) = #empty
		ifFalse: [ | old new |
			old := model population states at: toState.
			new := old + times.
			model population states at: toState put: new ]
]

{ #category : #accessing }
KE2EpiCTMCTransition >> fromState [
	^fromState 
]

{ #category : #accessing }
KE2EpiCTMCTransition >> fromState: aState [

	| reader |
	aState isDictionary ifTrue: [ ^ fromState := aState ].
		aState = #empty
		ifTrue: [ ^ self fromState: {(#status -> #empty)} ].
	aState isArray ifTrue: [ 
		^ fromState := Dictionary newFrom: aState ].
	(reader := STONReader on: aState readStream) 
		allowComplexMapKeys: true.
	^ fromState := reader next
]

{ #category : #printing }
KE2EpiCTMCTransition >> printOn: aStream [
	| f t |
	f := fromState isSymbol
		ifTrue: [ fromState asString ]
		ifFalse: [ fromState associations asString ].
	t := toState isSymbol
		ifTrue: [ toState asString ]
		ifFalse: [ toState associations asString ].
	aStream
		nextPutAll: '';
		nextPutAll: f;
		nextPutAll: '->';
		nextPutAll: '';
		nextPutAll: t
]

{ #category : #accessing }
KE2EpiCTMCTransition >> rate [ 
	^rate
]

{ #category : #accessing }
KE2EpiCTMCTransition >> rate: aBlockOrAnExpressionOrAnNumber [
	|prob|
	prob := aBlockOrAnExpressionOrAnNumber.
	aBlockOrAnExpressionOrAnNumber isString ifTrue: [ prob := aBlockOrAnExpressionOrAnNumber parseAsAnExpression ].
	rate := prob 
]

{ #category : #accessing }
KE2EpiCTMCTransition >> toState [
	^toState 
]

{ #category : #accessing }
KE2EpiCTMCTransition >> toState: aState [

	| reader |
	aState isDictionary ifTrue: [ ^ toState := aState ].
		aState = #empty ifTrue: [ ^ self toState: { #status -> #empty } ].
	aState isArray ifTrue: [ 
		^ toState := Dictionary newFrom: aState ].
	(reader := STONReader on: aState readStream) 
		allowComplexMapKeys: true.
	^ toState := reader next
]
