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
	| model |
	model := KEModel new.
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: {(#status -> #S)} put: 99 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	self assert: (model size == 100)
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
