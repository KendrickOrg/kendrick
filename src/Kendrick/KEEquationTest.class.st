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
KEEquationTest >> testNumberOfTransitionsIsCorrect [
	| model |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))};
	 addEquation: 'S:t=-beta*S*I + B - mu*S';
	 addEquation: 'I:t=beta*S*I - gamma*I - mu*I';
	 addEquation: 'R:t=gamma*I'.
	self assert: model transitions size equals: 5
]

{ #category : #tests }
KEEquationTest >> testPrintOn [

	| equation |
	equation := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	self assert: equation printString equals: 'dI/dt = beta*S*I-gamma*I'
]

{ #category : #tests }
KEEquationTest >> testTransitionProbabilityIsCorrect [
	| model |
	model := KEModel new.
	model
		attributes: {(#status -> #(#S #I #R))};
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I - gamma*I';
		addEquation: 'R:t=gamma*I'.
	self assert: model transitions first probability sign equals: -1
]
