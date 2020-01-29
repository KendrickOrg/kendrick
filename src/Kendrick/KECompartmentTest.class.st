Class {
	#name : #KECompartmentTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KECompartmentTest >> testAnEmptyPopulationHasNoCompartment [
	| p |
	p := KEPopulation new.
	self assert: p compartments isEmpty
]
