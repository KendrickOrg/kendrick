Class {
	#name : #KEVariableTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Semantic-Model-Core'
}

{ #category : #tests }
KEVariableTest >> testEvaluateWithModel [
	|model expr|
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	expr := 'S' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 99999.
]

{ #category : #tests }
KEVariableTest >> testEvaluateWithModel2 [
	|model expr|
	model := KEModel new population: (KEPopulation size: 10001).
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 10000 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	expr := 'beta*S*I' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 52.
]

{ #category : #tests }
KEVariableTest >> testName [
	| g |
	g := KEVariable new.
	g symbol: #gamma.
	self assert: g symbol equals: #gamma
]
