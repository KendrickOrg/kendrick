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
	^ functionExpr
]

{ #category : #acessing }
KEMathFunctionExpression >> functionExpr: anExpression [
	functionExpr := anExpression
]

{ #category : #acessing }
KEMathFunctionExpression >> functionName [
	^ functionName
]

{ #category : #acessing }
KEMathFunctionExpression >> functionName: aValue [
	functionName := aValue
]

{ #category : #'as yet unclassified' }
KEMathFunctionExpression >> generateEvents [

	^ OrderedCollection newFrom: { (KEEvent new rate: functionExpr) }
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

{ #category : #evaluating }
KEMathFunctionExpression >> removeIndexedVariable [
	|new|
	new := self copy.
	new functionExpr: functionExpr removeIndexedVariable.
	^ new
]

{ #category : #removing }
KEMathFunctionExpression >> removeVariable: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"

	^ self
]

{ #category : #acessing }
KEMathFunctionExpression >> sign [
	^ 1
]
