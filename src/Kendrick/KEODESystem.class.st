Class {
	#name : #KEODESystem,
	#superclass : #Object,
	#instVars : [
		'initialState',
		'equation'
	],
	#category : #'Kendrick-Tests-MM'
}

{ #category : #initialization }
KEODESystem >> equation: aString [

	equation := aString  parseAsAnExpression
]

{ #category : #initialization }
KEODESystem >> initialState: anInteger [

initialState := anInteger
]

{ #category : #initialization }
KEODESystem >> state: aState time: anInteger [

	| parameters |
	parameters := Dictionary new.
	parameters at: #state put: aState.
	parameters at: #time put: anInteger.
	^ equation expression evaluateWithParameters: parameters
]
