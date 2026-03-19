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

{ #category : #tests }
KECompartmentTest >> testCardinalityAndNameAccessors [
	| c |
	c := KECompartment new.
	c cardinality: 100.
	c compartmentName: #S.
	self assert: c cardinality equals: 100.
	self assert: c compartmentName equals: #S
]
