Class {
	#name : #KEModelTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEModelTest >> testAddAttributeValue [
	|model|
	model := KEModel new.
	model attributes: { 
		#status->#(#S #I #R). 
		}.
	model addAttribute: #species value: #(#reservoir1 #reservoir2 #mosquito).
	self assert: (model attributes at: #status) size equals: 3.
	self assert: (model attributes at: #species) size equals: 3
]

{ #category : #tests }
KEModelTest >> testAddParameter [
	| model |
	model := KEModel new.
	model addParameter: #beta -> 0.02.
	model addParameter: #gamma -> 0.01.
	self assert: model parameters size >= 2
]

{ #category : #tests }
KEModelTest >> testAddParameterExpression [
	|model |
	model := KEModel new.
	"two ways to specify a parameter as an expression"
	model addParameter: #beta value: [ :m| (m t) cos ].
	model addParameter: #gamma value: 'cos(t)'.
	model t: 60.
	self assert: (((model parameters) at: #beta) value: model) equals: (60 cos).
	self assert: (((model parameters) at: #gamma) value: model) equals: (60 cos).
]

{ #category : #tests }
KEModelTest >> testAddParameterValue [
	|model |
	model := KEModel new.
	model addParameter: #beta value: 0.02.

	self assert: (model atParameter: #beta) equals: 0.02.
]

{ #category : #tests }
KEModelTest >> testAddParameters [
	|model |
	model := KEModel new.
	model addParameters: {#beta->0.02. #gamma->0.01}.
	model addParameters: {#epsilon->0.01. #sigma->0.02}.
	self assert: (model atParameter: #beta) equals: 0.02.
	self assert: (model atParameter: #epsilon) equals: 0.01
]

{ #category : #tests }
KEModelTest >> testAddTransition [
	| model |
	model := KEModel new.
	model addTransition: (KETransition from: '{#status: #S}' to: '{#status: #I}' probability: 'beta*I' parseAsAnExpression).
	self assert: model transitions size equals: 1
]

{ #category : #tests }
KEModelTest >> testAnEmpyModelHasNoTransitions [
	| model |
	model := KEModel new.
	self assert: model transitions size equals: 0
]

{ #category : #tests }
KEModelTest >> testAtAttribute [
	|model|
	model := KEModel new.
	model attributes: { 
		#status->#(#S #I #R). 
		}.
	model addAttribute: #species value: #(#reservoir1 #reservoir2 #mosquito).
	self assert: (model atAttribute: #status) size equals: 3.
	self assert: (model atAttribute: #species) size equals: 3
]

{ #category : #tests }
KEModelTest >> testAtCompartment [
	|model compartment|
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	compartment := model atCompartment: { #status -> #S. #region -> #A.}.
	self assert: compartment equals: 99999
]

{ #category : #tests }
KEModelTest >> testAtCompartment2 [
	|model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I. #region->#A } put: 1.
	
	self assert: (model atCompartment: {#region->#A. #status->#S}) equals: 99999.
	self assert: (model atCompartment: {#region->#A}) equals: #(99999 1 0).
	self assert: (model atCompartment: {#status->#S}) equals: #(99999 0 0).
]

{ #category : #tests }
KEModelTest >> testAtCompartmentPut [
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(S I R).
	model atCompartment: { #status->#S } put: 100000.
	self assert: (model atCompartment: {#status->#S}) equals: 100000.
	
]

{ #category : #tests }
KEModelTest >> testAtCompartmentPutAtOthersPut [
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(S I R).
	model atCompartment: { #status->#S } put: 100000 atOthersPut: 0.
	self assert: (model atCompartment: {#status->#S}) equals: 100000.
]

{ #category : #tests }
KEModelTest >> testAtParameter [
	|model |
	model := KEModel new.
	model addParameter: #beta->0.02.
	model addParameter: #gamma->0.01.
	self assert: (model atParameter: #gamma) equals: 0.01.
	self assert: (model atParameter: #beta) equals: 0.02
	
]

{ #category : #tests }
KEModelTest >> testAtParameterAssignValue [
	|model|
	model := KEModel new.
	model addParameters: { #beta->0.01. #gamma->0.02 }.
	self assert: (model atParameter: #beta) equals: 0.01.
	model atParameter: #beta 
			assignValue: 
			[ :aModel| |c| 
				c := aModel currentCompartment at: #species.
				c = #mosquito ifTrue: [ ^ 0.03 ].
				c = #reservoir1 ifTrue: [ ^ 0.005 ].
				c = #reservoir2 ifTrue: [ ^ 0.001 ]
			].
	model currentCompartment: (Dictionary newFrom: {#status->#S. #species->#mosquito}).
	self assert: (model atParameter: #beta) equals: 0.03.
]

{ #category : #tests }
KEModelTest >> testAtStatusPut [
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(S I R).
	model addAttribute: #country value: #(A B C).
	model atStatus: #S put: 100000.
	self should: (model atCompartment: {#status->#S. #country->#A}) >= 33333.
	self should: (model atCompartment: {#status->#S. #country->#B}) >= 33333.
	self should: (model atCompartment: {#status->#S. #country->#C}) >= 33333.
	
]

{ #category : #tests }
KEModelTest >> testAtStatusPut2 [
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100).
	model addAttribute: #status value: #(S I R).
	model addAttribute: #node value: ((1 to: 100) collect: [:i| i asString asSymbol]).
	model atStatus: #S put: 99.
	self should: (model atCompartment: {#status->#S. #node->#'1'}) = 1.
	self should: (model atCompartment: {#status->#S. #node->#'2'}) = 1.
	self should: (model atCompartment: {#status->#S. #node->#'3'}) = 1.
	self should: (model atCompartment: {#status->#S. #node->#'100'}) >= 0.
	
	
]

{ #category : #tests }
KEModelTest >> testAttributes [
	|model|
	model := KEModel new.
	model attributes: { 
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2) }.
	
	self assert: (model attributes at: #status) size equals: 3.
	self assert: (model attributes at: #species) size equals: 3
]

{ #category : #tests }
KEModelTest >> testCompartmentNames [
	|model|
	model := KEModel new.
	self assert: (model compartmentNames size) equals: 0.
	model attributes: { 
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2) }.
	self assert: (model compartmentNames size) equals: 9.
	self assert: (model compartmentNames first size) equals: 2 
]

{ #category : #tests }
KEModelTest >> testEquationsToTransitions [
	| model |
	model := KEModel new.
	model addEquation: 'S:t=mu*N - beta*S*I - mu*S'.
	model addEquation: 'I:t=beta*S*I - gamma*I - mu*I'.
	model addEquation: 'R:t=gamma*I - mu*R'.
	self assert: model transitions size equals: 6
]

{ #category : #tests }
KEModelTest >> testIntegrate [
	|model concern|
	model := KEModel new population: (KEPopulation size: 1000).
	concern := KEModelPart new.
	concern addAttribute: #status value: #(S I R).
	concern 
		addTransitionFrom: { #status->#S } 
		to: { #status->#I } 
		probability: [ :aModel| aModel atParameter: #lambda].
	concern 
		addTransitionFrom: { #status->#I } 
		to: { #status->#R } 
		probability: [ :aModel| (aModel atParameter: #gamma)].
	concern addParameters: { #beta. #gamma }.
	concern addParameter: #lambda value: [ :aModel| (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I}) ]. 
	model integrate: concern.
	self should: ((model parameters size)  >= 3).
	self assert: (model transitions size) equals: 2.
	self assert: (model attributes size) equals: 1.
	self assert: (model compartmentNames size) equals: 3.  
]

{ #category : #tests }
KEModelTest >> testModelWithTwoCompartmentsOfSizeNineAneOneHasATotalSizeOfTen [
	| model |
	model := KEModel new population: (KEPopulation size: 10).
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 9.
	model atCompartment: {(#status -> #I)} put: 1.
	model atCompartment: {(#status -> #R)} put: 0.
	self assert: model population size equals: 10
]

{ #category : #tests }
KEModelTest >> testSizeOfEachCompartmentSizeOfSIRModel [
	| model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	self assert: (model sizeOfPopulation: #(#S)) equals: 99999.
	self assert: (model sizeOfPopulation: #(#I)) equals: 1.
	self assert: (model sizeOfPopulation: #(#R)) equals: 0
]
