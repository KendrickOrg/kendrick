"
A KESigmaFunctionExpression is a sum expression.

Instance Variables
	idVariable:		<Symbol>

idVariable
	- Name of index variable of sum expression

"
Class {
	#name : #KESigmaFunctionExpression,
	#superclass : #KEMathFunctionExpression,
	#instVars : [
		'idVariable'
	],
	#category : #'Kendrick-Core-MM1'
}

{ #category : #comparing }
KESigmaFunctionExpression >> = aMathExpSigma [
aMathExpSigma isNumber ifTrue: [ ^ self = (KENumerical new number: aMathExpSigma) ].
aMathExpSigma isExpressionWithSigmaMathFunction ifTrue:[
^(self functionName = aMathExpSigma functionName) and:
	[(self functionExpr = aMathExpSigma functionExpr) and:
	[self idVariable = aMathExpSigma idVariable]
	]
].
^false
]

{ #category : #evaluating }
KESigmaFunctionExpression >> evaluateWithModel: aModel [
	|expressionValue idInterval rs|
	idInterval := (aModel atParameter: (idVariable symbol)).
	expressionValue := Array new: (idInterval size).
	idInterval do: [ :id|
		"parameters at: (idVariable symbol) put: id."
		aModel addTemporalParameter: (idVariable symbol) value: id.
		expressionValue at: id put: (functionExpr evaluateWithModel: aModel)
		 ].
	(functionName = #sum) ifTrue: [
		rs := 0.
		expressionValue do: [:a| rs := rs + a]].
	^ rs
]

{ #category : #accessing }
KESigmaFunctionExpression >> idVariable [
	^ idVariable
]

{ #category : #accessing }
KESigmaFunctionExpression >> idVariable: aValue [
	idVariable := aValue
]

{ #category : #testing }
KESigmaFunctionExpression >> isExpressionWithSigmaMathFunction [
	^ true
]

{ #category : #printing }
KESigmaFunctionExpression >> printOn: aStream [
	aStream
		nextPutAll: functionName asString;
		nextPutAll: '(';
		nextPutAll: idVariable asString;
		nextPutAll: ',';
		nextPutAll: functionExpr asString;
		nextPutAll: ')'
]

{ #category : #testing }
KESigmaFunctionExpression >> removeIndexedVariable [
	^ functionExpr removeIndexedVariable
]

{ #category : #acessing }
KESigmaFunctionExpression >> sign [
	^ functionExpr sign
]
