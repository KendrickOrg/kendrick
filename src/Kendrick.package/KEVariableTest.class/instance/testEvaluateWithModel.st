tests
testEvaluateWithModel
	|model expr|
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	expr := 'S' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 99999.