tests
testEvaluateWithModel2
	| tmp1 tmp2 |
	tmp1 := KEModel new population: (KEPopulation size: 10001).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 10000 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	tmp2 := 'beta*S*I' parseAsAnExpression.
	self assert: (tmp2 evaluateWithModel: tmp1) equals: 52