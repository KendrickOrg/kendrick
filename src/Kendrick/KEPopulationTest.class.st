Class {
	#name : #KEPopulationTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEPopulationTest >> testAddIndividual [
	|population ind |
	population := KEPopulation new.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	ind := KEIndividual new currentStatus: (Dictionary newFrom: {#status->#I}).
	population addIndividual: ind.
	
	self assert: (population individuals size) equals: 1001 
]

{ #category : #tests }
KEPopulationTest >> testNewPopulationIsEmpty [
	self assert: KEPopulation new size equals: 0
]

{ #category : #tests }
KEPopulationTest >> testRemoveIndividual [
	|population  |
	population := KEPopulation new.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	population removeIndividual: (population individuals last).
	
	self assert: (population individuals size) equals: 1000.
	self assert: (population diedIndList size) equals: 1.
	self assert: (population individuals last) isAlive equals: false  
]

{ #category : #tests }
KEPopulationTest >> testSizeOfPopulation [
	|model|
	model := KEModel new.
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	"model initializeCompartments."
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I. #region->#A } put: 1.
	
	self assert: (model population size) equals: 100000.
	self assert: (model population sizeOfPopulation: {#A}) equals: 100000.
	self assert: (model population sizeOfPopulation: {#A. #S}) equals: 99999.
	self assert: (model population sizeOfPopulation: {#S}) equals: 99999.
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

{ #category : #tests }
KEPopulationTest >> testUpdateIndividual [
	|population ind |
	population := KEPopulation new.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	ind := population individuals last.
	ind nextStatus: (Dictionary newFrom: {#status->#R}).
	population updateIndividual: ind.
	self assert: (population individuals size) equals: 1000.
	self assert: (population individuals last) nextStatus equals: nil.
	self assert: ((population individuals last) currentStatus at: #status) equals: #R
]
