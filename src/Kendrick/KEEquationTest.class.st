Class {
	#name : #KEEquationTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Examples-Core'
}

{ #category : #tests }
KEEquationTest >> testEquationHasOneEvent [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| equation |
	equation := 'S:t=beta*S*I' parseAsAnEquation.
	self assert: (equation generateEvents) size equals: 1.
	^equation 
]

{ #category : #tests }
KEEquationTest >> testEquationHasTwoEvents [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| equation |
	equation := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	self assert: (equation generateEvents) size equals: 2.
	^ equation 
]

{ #category : #tests }
KEEquationTest >> testNumberOfEquationsOfSEIRSIs4 [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| model simulator |
	model := KEModel new.
	model attributes: { (#status -> #( #S #E #I #R )) }.
	model atCompartment: { (#status -> #S) } put: 99999.
	model atCompartment: { (#status -> #E) } put: 1.
	model atCompartment: { (#status -> #I) } put: 0.
	model atCompartment: { (#status -> #R) } put: 0.

	model addParameters: { 
			(#mu -> (1 / (76 * 365))).
			(#beta -> 0.21).
			(#gamma -> (1 / 14)).
			(#sigma -> (1 / 7)).
			(#nu -> (1 / 365)) }.
	model addEquation: 'S:t=mu*N - beta*S*I/N - mu*S + nu*R'.
	model addEquation: 'E:t=beta*S*I/N - sigma*E - mu*E.'.
	model addEquation: 'I:t=sigma*E - gamma*I - mu*I'.
	model addEquation: 'R:t=gamma*I - mu*R - nu*R.'.

	simulator := KESimulator
		             new: #RungeKutta
		             from: 0.0
		             to: 1000
		             step: 1.
	simulator executeOn: model.
	"We need to transform ODE to transitions, because at the moment this is not done explicitely every time you execute a model that is based on ODE equations."
	model equationsToTransitions.
	
	self assert: model equations2 size equals: 4.
	^ model




]

{ #category : #tests }
KEEquationTest >> testNumberOfEquationsOfSIRModelIs3 [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| model simulator |
	model := KEModel new.
	model attributes: { (#status -> #( #S #I #R )) }.
	model atCompartment: { (#status -> #S) } put: 99999.
	model atCompartment: { (#status -> #I) } put: 1.
	model atCompartment: { (#status -> #R) } put: 0.

	model addParameters: { 
			(#beta -> 0.0052).
			(#gamma -> 52) }.
	model addEquation: 'S:t = -beta*S*I'.
	model addEquation: 'I:t = beta*S*I - gamma*I'.
	model addEquation: 'R:t = gamma*I'.
	simulator := KESimulator
		             new: #RungeKutta
		             from: 0.0
		             to: 0.3
		             step: 0.0027.
	simulator executeOn: model.
	"We need to transform ODE to transitions, because at the moment this is not done explicitely every time you execute a model that is based on ODE equations."
	model equationsToTransitions.

	self assert: model equations2 size equals: 3.
	^ model
]

{ #category : #tests }
KEEquationTest >> testNumberOfEquationsOfSIRModelWithTransitions [
	<gtExample>
	<subjectClass: #KEEquationTest>
	<expectedFailure>
	| model simulator |
	model := KEModel new.
	model attributes: { (#status -> #( #S #I #R )) }.
	model atCompartment: { (#status -> #S) } put: 99999.
	model atCompartment: { (#status -> #I) } put: 1.
	model atCompartment: { (#status -> #R) } put: 0.
	model addParameters: { 
			(#beta -> 0.0052).
			(#gamma -> 52) }.
	model
		addTransitionFrom: { (#status -> #S) }
		to: { (#status -> #I) }
		probability: [ :m | 
			(m atParameter: #beta) * (m atCompartment: { (#status -> #I) }) ].
	model
		addTransitionFrom: { (#status -> #I) }
		to: { (#status -> #R) }
		probability: [ :m | m atParameter: #gamma ].
	simulator := KESimulator
		             new: #RungeKutta
		             from: 0.0
		             to: 0.20
		             step: 0.001.
	simulator executeOn: model.
	self assert: model equations2 size equals: 3.
	^model
]

{ #category : #tests }
KEEquationTest >> testNumberOfTransitionsIsCorrect [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| model |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))};
	 addEquation: 'S:t=-beta*S*I + B - mu*S';
	 addEquation: 'I:t=beta*S*I - gamma*I - mu*I';
	 addEquation: 'R:t=gamma*I'.
	self assert: model transitions size equals: 5.
	^model
]

{ #category : #tests }
KEEquationTest >> testPrintOn [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| equation |
	equation := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	self assert: equation printString equals: 'dI/dt = beta*S*I-gamma*I'.
	^equation 
]

{ #category : #tests }
KEEquationTest >> testPrintOnPreserveMultiplicationPriority [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| equation |
	equation := 'X:t = A*(B+C)' parseAsAnEquation.
	self assert: equation printString equals: 'dX/dt = A*(B+C)'.
	^ equation 
]

{ #category : #tests }
KEEquationTest >> testSIRMOdelEquationsContainSVariable [
	<gtExample>
	<subjectClass: #KEEquationTest>
	| model simulator |
	model := KEModel new.
	model attributes: { (#status -> #( #S #I #R )) }.
	model atCompartment: { (#status -> #S) } put: 99999.
	model atCompartment: { (#status -> #I) } put: 1.
	model atCompartment: { (#status -> #R) } put: 0.

	model addParameters: { 
			(#beta -> 0.0052).
			(#gamma -> 52) }.
	model addEquation: 'S:t = -beta*S*I'.
	model addEquation: 'I:t = beta*S*I - gamma*I'.
	model addEquation: 'R:t = gamma*I'.
	simulator := KESimulator
		             new: #RungeKutta
		             from: 0.0
		             to: 0.3
		             step: 0.0027.
	simulator executeOn: model.
	"We need to transform ODE to transitions, because at the moment this is not done explicitely every time you execute a model that is based on ODE equations."
	model equationsToTransitions.
	self
		assert:
		((model equations2 collect: [ :eq | eq variable ]) includes: {#status -> #S})
		equals: true.
		
	^ model
]

{ #category : #tests }
KEEquationTest >> testTransitionProbabilityIsCorrect [
	| model |
	model := KEModel new.
	model
		attributes: {(#status -> #(#S #I #R))};
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I - gamma*I';
		addEquation: 'R:t=gamma*I'.
	self assert: model transitions first probability sign equals: -1.
	^ model
]
