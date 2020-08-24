"
A KEMathFunctionExpression is an expression that represent a mathematical fuction such as: sin, cos, exp, log, tan etc.

Instance Variables
	functionExpr:		<KEExpression>
	functionName:		<Symbol>

exprInFunction
	- xxxxx

functionName
	- xxxxx

"
Class {
	#name : #KEMathFunctionExpression,
	#superclass : #KEExpression,
	#instVars : [
		'functionName',
		'functionExpr'
	],
	#category : #'Kendrick-Core'
}

{ #category : #comparing }
KEMathFunctionExpression >> = aMathExp [
	aMathExp isNumber
		ifTrue: [ ^ self = (KENumerical new number: aMathExp) ].
	aMathExp isExpressionWithMathFunction
		ifTrue: [ ^ self functionName = aMathExp functionName and: [ self functionExpr = aMathExp functionExpr ] ].
	^ false
]

{ #category : #checking }
KEMathFunctionExpression >> checkHasVariable: aDictionary [
	^ functionExpr checkHasVariable: aDictionary
]

{ #category : #checking }
KEMathFunctionExpression >> checkNil [
	^ functionExpr isNil
]

{ #category : #evaluating }
KEMathFunctionExpression >> evaluateWithModel: aModel [

| expressionValue |
expressionValue := functionExpr evaluateWithModel: aModel.

(functionName = #sin) ifTrue: [^(expressionValue sin)].
(functionName = #cos) ifTrue: [^(expressionValue cos)].
(functionName = #log) ifTrue: [^(expressionValue log)].
(functionName = #exp) ifTrue: [^(expressionValue exp)]
]

{ #category : #acessing }
KEMathFunctionExpression >> functionExpr [
	<MSEProperty: #functionExpr type: #KEExpression>
	^ functionExpr
]

{ #category : #acessing }
KEMathFunctionExpression >> functionExpr: anExpression [
	functionExpr := anExpression
]

{ #category : #acessing }
KEMathFunctionExpression >> functionName [
	<MSEProperty: #function type: #String>
	^ functionName
]

{ #category : #acessing }
KEMathFunctionExpression >> functionName: aValue [
	functionName := aValue
]

{ #category : #'as yet unclassified' }
KEMathFunctionExpression >> generateEvents [
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: functionExpr.
	list add: e.
	^ list
]

{ #category : #checking }
KEMathFunctionExpression >> isExpressionWithMathFunction [
	^ true
]

{ #category : #converting }
KEMathFunctionExpression >> normalize [
	^ self
]

{ #category : #printing }
KEMathFunctionExpression >> printOn: aStream [
	aStream
		nextPutAll: functionName asString;
		nextPutAll: '(';
		nextPutAll: functionExpr asString;
		nextPutAll: ')'
]

{ #category : #removing }
KEMathFunctionExpression >> remove: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	^ self
]

{ #category : #evaluating }
KEMathFunctionExpression >> removeIndexedVariable [
	|new|
	new := self copy.
	new functionExpr: functionExpr removeIndexedVariable.
	^ new
]

{ #category : #acessing }
KEMathFunctionExpression >> sign [
	^ 1
]
