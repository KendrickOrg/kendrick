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
KEPopulationTest >> testSizeOfPopulationIsTheSameThanTheSumOfItsCompartment [
	| model compartmentSSize compartmentISize |
	model := KEModel
		new
		addAttribute: #status value: #(#S #I #R).
	compartmentSSize := 99.
	compartmentISize := 1.
	model atCompartment: {(#status -> #S)} put: compartmentSSize atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: compartmentISize.
	self assert: model population size equals: compartmentSSize + compartmentISize
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
