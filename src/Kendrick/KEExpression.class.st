"
A KEExpression is an abtract class for all expressions in system.

"
Class {
	#name : #KEExpression,
	#superclass : #KEEntity,
	#category : 'Kendrick-Semantic-Model-Core'
}

{ #category : #meta }
KEExpression class >> annotation [
	<MSEClass: #Expression super: #KEEntity >
	<package: #KE>
	^ self
]

{ #category : #testing }
KEExpression >> addExpression: anExpression [
	^ KEBinaryExpression new
		op: #+;
		leftHandSide: self;
		rightHandSide: anExpression
]

{ #category : #evaluating }
KEExpression >> evaluateWithModel: aModel [
	self subclassResponsibility
]

{ #category : #testing }
KEExpression >> isAContactVariable [
	^ false
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
KEExpression >> isCouplingExpression [
	^ false
]

{ #category : #testing }
KEExpression >> isExpression [
	^ true
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
KEExpression >> isMovementExpression [
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

{ #category : #testing }
KEExpression >> value: model [
	^ self evaluateWithModel: model
]
