tests
testEquationHasTwoEvents
	| equation |
	equation := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	self assert: (equation generateEvents: (KEPopulation new)) size equals: 2