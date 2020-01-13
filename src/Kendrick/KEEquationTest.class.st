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

{ #category : #tests }
KEEquationTest >> testTransitionsNumberIsCorrect [
	| model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {(#status -> #(#S #I #R))}.
	model addEquation: 'S:t=-beta*S*I + B - mu*S'.
	model addEquation: 'I:t=beta*S*I - gamma*I - mu*I'.
	model addEquation: 'R:t=gamma*I'.
	model transitions 
]
