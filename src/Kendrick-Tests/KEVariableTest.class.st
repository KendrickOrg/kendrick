Class {
	#name : #KEVariableTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEVariableTest >> testEvaluateWithModel [
	|model expr|
	model := KEModel new.
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	expr := 'S' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 99999.
]

{ #category : #tests }
KEVariableTest >> testEvaluateWithModel2 [
	|model expr|
	model := KEModel new.
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 10000 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	expr := 'beta*S*I' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 52.
]

{ #category : #tests }
KEVariableTest >> testEvaluateWithModel3 [

	| model expr |
	model := KEModel new.
	model attributes: { (#status -> #( S I R )) }.
	model atCompartment: { (#status -> #S) } put: 10000 atOthersPut: 0.
	model atCompartment: { (#status -> #I) } put: 1.
	model addParameters: { 
			(#beta -> 0.0052).
			(#gamma -> 52) }.
	expr := '-beta*S*I' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: -52
]

{ #category : #tests }
KEVariableTest >> testGenerateEvents [
	| g |
	g := KEVariable new.
	g symbol: #gamma.
	self assert: g generateEvents size equals:1
]

{ #category : #tests }
KEVariableTest >> testName [
	| g |
	g := KEVariable new.
	g symbol: #gamma.
	self assert: g symbol equals: #gamma
]

{ #category : #tests }
KEVariableTest >> testWithSIRModel [

	| model |
	model := KEModel new.
	model addAttribute: #status value: #( #S #I #R ).
	model atCompartment: { (#status -> #S) } put: 0.7 atOthersPut: 0.
	model atCompartment: { (#status -> #I) } put: 0.3.
	model addParameters: { 
			(#beta -> 1.4247).
			(#gamma -> 0.14286) }.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	self
		assert: ((model equations at: 1) evaluateWithModel: model)
		closeTo: ((model atParameter: #beta) * 0.7 * 0.3) negated.
	self
		assert: ((model equations at: 2) evaluateWithModel: model)
		closeTo: (model atParameter: #beta) * 0.7 * 0.3
			- ((model atParameter: #gamma) * 0.3).
	self
		assert: ((model equations at: 3) evaluateWithModel: model)
		closeTo: (model atParameter: #gamma) * 0.3
]
