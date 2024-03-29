"
A KEExpression is an abtract class for all expressions in system.

"
Class {
	#name : #KEExpression,
	#superclass : #KEEntity,
	#category : #'Kendrick-Core-MM1'
}

{ #category : #testing }
KEExpression >> * aKEExpression [

	^ KEBinaryExpression new
		  op: #*;
		  leftHandSide: self;
		  rightHandSide: aKEExpression
]

{ #category : #testing }
KEExpression >> + aKEExpression [

	^ KEBinaryExpression new
		  op: #+;
		  leftHandSide: self;
		  rightHandSide: aKEExpression
]

{ #category : #evaluating }
KEExpression >> evaluateWithModel: aModel [
	self subclassResponsibility
]

{ #category : #evaluating }
KEExpression >> evaluateWithParameters: parameters [

	self subclassResponsibility
]

{ #category : #testing }
KEExpression >> isAVariable [
	^ false
]

{ #category : #testing }
KEExpression >> isAnIndexedVariable [
	^ false
]

{ #category : #testing }
KEExpression >> isBinaryExpression [
	^ false
]

{ #category : #testing }
KEExpression >> isExpressionWithMathFunction [
	^ false
]

{ #category : #testing }
KEExpression >> isExpressionWithSigmaMathFunction [
	^ false
]

{ #category : #testing }
KEExpression >> isNumerical [
	^ false
]

{ #category : #testing }
KEExpression >> isSeparable [
	^ false
]

{ #category : #testing }
KEExpression >> isUnaryExpression [
	^ false
]

{ #category : #testing }
KEExpression >> negated [
	^ KEUnaryExpression new
		op: #-;
		expression: self
]

{ #category : #evaluating }
KEExpression >> normalize [

	self subclassResponsibility
]

{ #category : #testing }
KEExpression >> removeVariable: aVariable [
	self subclassResponsibility
]

{ #category : #testing }
KEExpression >> value: model [
	^ self evaluateWithModel: model
]
