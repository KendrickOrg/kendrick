tests
testEquationHasTwoEvents
	| tmp1 |
	tmp1 := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	self assert: tmp1 generateEvents size equals: 2