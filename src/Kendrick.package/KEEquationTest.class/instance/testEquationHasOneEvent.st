tests
testEquationHasOneEvent
	| equation |
	equation := 'S:t=beta*S*I' parseAsAnEquation.
	self assert: (equation generateEvents: (KEPopulation new)) size equals: 1