Class {
	#name : #KEODESystem,
	#superclass : #Object,
	#instVars : [
		'initialState',
		'bindings',
		'equations'
	],
	#category : #'Kendrick-Tests-MM'
}

{ #category : #initialization }
KEODESystem >> equations: aStringArray [

	equations := aStringArray collect: [ :each | 
		             each parseAsAnExpression ].
	
]

{ #category : #initialization }
KEODESystem >> initialState: aVector [

	initialState := aVector.
	equations
		with: initialState
		do: [ :eq :value | bindings at: eq variable symbol put: value ]
]

{ #category : #initialization }
KEODESystem >> initialize [

bindings := Dictionary new
]

{ #category : #initialization }
KEODESystem >> state: aState time: anInteger [

	bindings at: #time put: anInteger.
	^ equations collect:[:each| each expression evaluateWithParameters: bindings]
]
