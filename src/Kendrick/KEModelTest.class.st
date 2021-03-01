Class {
	#name : #KEModelTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEModelTest >> testANewModelHasTwoParameters [
	| model |
	model := KEModel new.
	self assert: model parameters size equals: 2
]

{ #category : #tests }
KEModelTest >> testAddNewAttributeAfterInitialOnes [
	| model |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model addAttribute: #species value: #(#reservoir1 #reservoir2 #mosquito).
	self assert: (model attributes size) equals: 2.
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
	model addTransition: (KETransition from: {#status -> #S} to: {#status -> #I} probability: 'beta*I' parseAsAnExpression).
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
	model := KEModel new.
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	compartment := model atCompartment: { #status -> #S. #region -> #A.}.
	self assert: compartment equals: 99999
]

{ #category : #tests }
KEModelTest >> testAtCompartment2 [
	|model |
	model := KEModel new.
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I. #region->#A } put: 1.
	
	self assert: (model atCompartment: {#region->#A. #status->#S}) equals: 99999.
	self assert: (model atCompartment: {#region->#A}) equals: #(99999 1 0).
	self assert: (model atCompartment: {#status->#S}) equals: #(99999 0 0).
]

{ #category : #tests }
KEModelTest >> testAtCompartmentPut [
	| model |
	model := KEModel new.
	model attributes:{#status ->  #(S I R)}.
	model atCompartment: {(#status -> #S)} put: 100000.
	self assert: (model atCompartment: {(#status -> #S)}) equals: 100000
]

{ #category : #tests }
KEModelTest >> testAtCompartmentPutAtOthersPut [
	| model |
	model := KEModel new.
	model attributes:{#status -> #(S I R)}.
	model atCompartment: {(#status -> #S)} put: 100000 atOthersPut: 0.
	self assert: (model atCompartment: {(#status -> #S)}) equals: 100000
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
	| model |
	model := KEModel new
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#mosquito #reservoir1 #reservoir2))}.
	self assert: model compartmentNames size equals: 9.
	self assert: model compartmentNames first size equals: 2
]

{ #category : #tests }
KEModelTest >> testEmptyModelHasNoCompartmentNames [
	| model |
	model := KEModel new.
	self assert: model compartmentNames isEmpty
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
KEModelTest >> testGenerateEvents1 [
	| model events |
	model := KEModel new.
	events := model
		addEquation: 'S:t=-betaI*S*I-betaH*S*H-betaF*S*F';
		addEquation: 'E:t=betaI*S*I+betaH*S*H+betaF*S*F-alpha*E';
		addEquation: 'I:t=alpha*E';
		generateEvents.
	self assert: events size equals: 2
]

{ #category : #tests }
KEModelTest >> testGenerateEventsOfMultiDiseasesModel [
	| model events |
	model := KEModel new.
	model
		addEquation: 'SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS';
		addEquation: 'IS:t=beta1*SS*(IS+II+IR)-beta2*IS*(SI+II+RI)-(mu+sigma1)*IS';
		addEquation: 'SI:t=beta2*SS*(SI+II+RI)-beta1*SI*(IS+II+IR)-(mu+sigma2)*SI';
		addEquation: 'RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS';
		addEquation: 'SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR';
		addEquation: 'II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II';
		addEquation: 'RI:t=beta2*RS*(SI+II+RI)+sigma1*II-(mu+sigma2)*RI';
		addEquation: 'IR:t=beta1*SR*(IS+II+IR)+sigma2*II-(mu+sigma1)*IR';
		addEquation: 'RR:t=sigma1*IR+sigma2*RI-mu*RR'.
	events := model generateEvents.
	self assert: events size equals: 22
]

{ #category : #tests }
KEModelTest >> testGenerateEventsOfMultiHostsModel [
	| model  events dsdt didt |
	model := KEModel new.
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]'.
	didt := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]'.
	model addEquation: dsdt.
	model addEquation: didt.
	events := model generateEvents.
	self assert: events size equals: 4
]

{ #category : #tests }
KEModelTest >> testGenerateEventsOfSIRMetapopulationModel [
	| model events |
	model := KEModel new.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model addEquation: 'I:t=beta*S*I-v*I-mu*I'.
	model addEquation: 'R:t=v*I-mu*R'.
	events := model generateEvents.
	self assert: events size equals: 6
]

{ #category : #tests }
KEModelTest >> testGenerateEventsOfSIRModel [
	| model events |
	model := KEModel new.
	model
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I-gamma*I';
		addEquation: 'R:t=gamma*I'.
	events := model generateEvents.
	self assert: events size equals: 2
]

{ #category : #tests }
KEModelTest >> testIntegrate [
	|model concern|
	model := KEModel new.
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
KEModelTest >> testModelWithSixCompartments [
|model|
model := KEModel new.
model addAttribute: #status value: #(S I R).
model addAttribute: #country value: #(Vietnam France).
model initializeCompartments.
self assert: model population compartments size equals:6

]

{ #category : #tests }
KEModelTest >> testModelWithTwoCompartmentsOfSizeNineAneOneHasATotalSizeOfTen [
	| model |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model initializeCompartments.
	model atCompartment: {(#status -> #S)} put: 9.
	model atCompartment: {(#status -> #I)} put: 1.
	model atCompartment: {(#status -> #R)} put: 0.
	self assert: model population size equals: 10
]

{ #category : #tests }
KEModelTest >> testSIRModelHasThreeCompartments [
	| model |
	model := KEModel new attributes: {(#status -> #(#S #I #R))}.
	self assert: model compartmentNames size equals: 3
]

{ #category : #tests }
KEModelTest >> testSizeOfEachCompartmentSizeOfSIRModel [
	| model |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model initializeCompartments.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	self assert: (model sizeOfPopulation: #(#S)) equals: 99999.
	self assert: (model sizeOfPopulation: #(#I)) equals: 1.
	self assert: (model sizeOfPopulation: #(#R)) equals: 0
]

{ #category : #tests }
KEModelTest >> testWhenCompartmentDoesNotExistRaiseAnError [
	| model |
	model := KEModel new.
	model addAttribute: #status value: #(S I R).
	model addAttribute: #country value: #(A B C).
	model initializeCompartments.
	self
		should: [ model atCompartment: {(#status -> #S)} put: 100 ]
		raise: Error
]
