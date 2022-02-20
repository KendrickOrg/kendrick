Class {
	#name : #KECompartmentTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Examples-Core'
}

{ #category : #tests }
KECompartmentTest >> testAnEmptyPopulationHasNoCompartment [
	<gtExample>
	<subjectClass: #KECompartmentTest>
	| p |
	p := KEPopulation new.
	self assert: p compartments isEmpty.
	^p
]
