tests
testParserIndexedVariable
	| tmp1 |
	tmp1 := 'beta[i][j]=exp(-(i-j)^2/d)' parseAsAnEquation.
	self
		assert: tmp1 variable isAnIndexedVariable equals: true;
		assert: tmp1 variable symbol equals: #beta;
		assert: (tmp1 variable atIndex: 1) symbol equals: #i;
		assert: (tmp1 variable atIndex: 1) isAVariable equals: true;
		assert: (tmp1 variable atIndex: 2) symbol equals: #j