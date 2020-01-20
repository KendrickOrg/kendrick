Class {
	#name : #KEEquationTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEEquationTest >> testEquationHasOneEvent [
	| equation |
	equation := 'S:t=beta*S*I' parseAsAnEquation.
	self assert: (equation generateEvents) size equals: 1
]

{ #category : #tests }
KEEquationTest >> testEquationHasTwoEvents [
	| equation |
	equation := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	self assert: (equation generateEvents) size equals: 2
]
