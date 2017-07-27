tests
testEquationHasOneEvent
	| tmp1 |
	tmp1 := 'S:t=beta*S*I' parseAsAnEquation.
	self assert: tmp1 generateEvents size equals: 1