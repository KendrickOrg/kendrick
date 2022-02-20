Class {
	#name : #KEPopulationTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Examples-Core'
}

{ #category : #tests }
KEPopulationTest >> testNewPopulationIsEmpty [
	<gtExample>
	<subjectClass: #KEPopulationTest>
	self assert: KEPopulation new size equals: 0
]

{ #category : #tests }
KEPopulationTest >> testSizeOfPopulationIsTheSameThanTheSumOfItsCompartment [
	<gtExample>
	<subjectClass: #KEPopulationTest>
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
		equals: compartmentSSize + compartmentISize + compartmentRSize.
		
	^model
]
