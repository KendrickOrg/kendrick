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
KECompartmentTest >> testCreatingCompartment [
	| c |
	c := KECompartment new
		compartmentName: {(#status -> #S)};
		cardinality: 1000; 
		yourself.
	self assert: c compartmentName equals: {(#status -> #S)}.
	self assert: c cardinality equals: 1000
]

{ #category : #tests }
KECompartmentTest >> testCreatingMoreComplexCompartmentName [

	| c |
	c := KECompartment new
		     compartmentName: { 
				     (#status -> #S).
				     (#species -> #human) };
		     cardinality: 1000;
		     yourself.
	self assert: c compartmentName equals: { 
			(#status -> #S).
			(#species -> #human) }.
	self assert: c cardinality equals: 1000
]
