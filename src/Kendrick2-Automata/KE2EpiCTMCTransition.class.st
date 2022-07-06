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
