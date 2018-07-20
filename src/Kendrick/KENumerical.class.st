"
A KENumerical is a number.

Instance Variables
	number:		<Number>

number
	- the value of the number

"
Class {
	#name : #KENumerical,
	#superclass : #KESimpleExpression,
	#instVars : [
		'number'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KENumerical class >> number: aNumber [


^super new number: aNumber
]

{ #category : #evaluating }
KENumerical >> = aNumerical [
	aNumerical isNumber ifTrue: [ ^ self = (KENumerical new number: aNumerical) ].
	aNumerical isNumerical ifTrue: [ ^ self number = aNumerical number ].
	^ false
	
]

{ #category : #evaluating }
KENumerical >> checkHasVariable: aDictionary [
	^ false
]

{ #category : #evaluating }
KENumerical >> checkNil [
	^ number = nil
]

{ #category : #evaluating }
KENumerical >> evaluateWithModel: aModel [
	^ number
]

{ #category : #evaluating }
KENumerical >> getParameter: aDictionary [
	^ nil
]

{ #category : #printing }
KENumerical >> isNumerical [
	^ true
]

{ #category : #evaluating }
KENumerical >> normalize [
	^ self
]

{ #category : #evaluating }
KENumerical >> number [
	<MSEProperty: #number type: #Number>
	^ number
]

{ #category : #accessing }
KENumerical >> number:aNumber [
	number := aNumber
]

{ #category : #printing }
KENumerical >> printOn: aStream [
	aStream 
		nextPutAll: number asString
]

{ #category : #evaluating }
KENumerical >> remove: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	^ self
]

{ #category : #evaluating }
KENumerical >> removeIndexedVariable [
	^ self
]

{ #category : #evaluating }
KENumerical >> sign [
	^ number sign
]
