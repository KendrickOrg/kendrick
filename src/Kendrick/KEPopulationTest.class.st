Class {
	#name : #KEPopulationTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEPopulationTest >> testNewPopulationIsEmpty [
	self assert: KEPopulation new size equals: 0
]

{ #category : #tests }
KEPopulationTest >> testSizeOfPopulationIsTheSameThanTheSumOfItsCompartment [
	| model compartmentSSize compartmentISize compartmentRSize |
	model := KEModel new attributes:{#status -> #(#S #I #R)}.
	compartmentSSize := 99.
	compartmentISize := 1.
	compartmentRSize := 0.
	model
		atCompartment: {(#status -> #S)} put: compartmentSSize;
		atCompartment: {(#status -> #I)} put: compartmentISize;
		atCompartment: {(#status -> #R)} put: compartmentRSize.
	self
		assert: model population size
		equals: compartmentSSize + compartmentISize + compartmentRSize
]
