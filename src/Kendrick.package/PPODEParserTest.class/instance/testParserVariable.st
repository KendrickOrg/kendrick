tests
testParserVariable
	| tmp1 tmp2 |
	tmp1 := 'S:t=-beta*S*I' parseAsAnEquation.
	tmp2 := 'beta = exp(-d^2)' parseAsAnEquation.
	self
		assert: tmp1 variable symbol equals: #S;
		assert: tmp1 tVariable symbol equals: #t;
		assert: tmp2 variable symbol equals: #beta