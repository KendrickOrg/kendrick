tests
testEvaluateWithModel2
	|model expr|
	model := KEModel new population: (KEPopulation size: 10001).
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 10000 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	expr := 'beta*S*I' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 52.