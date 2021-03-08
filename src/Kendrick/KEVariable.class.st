"
A KEVariable is a variable in equation.

Instance Variables
	symbol:		<Symbol>

symbol
	- Name of the variable

"
Class {
	#name : #KEVariable,
	#superclass : #KESimpleExpression,
	#instVars : [
		'symbol'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KEVariable class >> symbol: aSymbol [

^super new symbol: aSymbol
]

{ #category : #comparing }
KEVariable >> = anExpression [
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
anExpression isAVariable
	ifTrue:[^self symbol = anExpression symbol].
^false
]

{ #category : #testing }
KEVariable >> checkNil [
	^ (symbol isNil)
]

{ #category : #'as yet unclassified' }
KEVariable >> evaluateWithModel: model [
	((model attributes at: #status ifAbsent: [ OrderedCollection new ])
		includes: symbol)
		ifTrue: [ ^ model atCompartment: {(#status -> symbol)} ].
^ model atParameter: symbol.

]

{ #category : #'as yet unclassified' }
KEVariable >> generateEvents [
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: self.
	list add: e.
	^ list
]

{ #category : #testing }
KEVariable >> isAVariable [

^true
]

{ #category : #converting }
KEVariable >> normalize [
	^ self
]

{ #category : #printing }
KEVariable >> printOn: aStream [
	aStream 
		nextPutAll: symbol asString
]

{ #category : #evaluating }
KEVariable >> removeIndexedVariable [
	^ self
]

{ #category : #removing }
KEVariable >> removeVariable: aVariable [

	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"

	self = aVariable ifTrue: [ ^ nil ]
]

{ #category : #testing }
KEVariable >> sign [
^1
]

{ #category : #testing }
KEVariable >> symbol [
	^ symbol
]

{ #category : #accessing }
KEVariable >> symbol: aSymbol [ 
	symbol := aSymbol
]
