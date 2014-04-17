tests
testParserIndexedVariable
	|betaEquation|
	betaEquation := 'beta[i][j]=exp(-(i-j)^2/d)' parseAsAnEquation.
	self assert: (betaEquation variable isAnIndexedVariable) equals: true.
	self assert: (betaEquation variable symbol) equals: #beta.
	self assert: ((betaEquation variable atIndex: 1) symbol) equals: #i.
	self assert: ((betaEquation variable atIndex: 1) isAVariable) equals: true.
	self assert: ((betaEquation variable atIndex: 2) symbol) equals: #j
