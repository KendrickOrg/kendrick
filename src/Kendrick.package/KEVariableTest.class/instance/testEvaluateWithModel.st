tests
testEvaluateWithModel
	| tmp1 tmp2 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1.
	tmp2 := 'S' parseAsAnExpression.
	self assert: (tmp2 evaluateWithModel: tmp1) equals: 99999