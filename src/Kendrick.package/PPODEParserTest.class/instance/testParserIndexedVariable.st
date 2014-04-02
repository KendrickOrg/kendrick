tests
testParserIndexedVariable
	|betaEquation|
	betaEquation := 'beta[i,j]=exp(-(i-j)^2/d)' parseAsAnEquation.
	self assert: (betaEquation variable isAnIndex) equals: true.
	self assert: (betaEquation variable symbol) equals: #beta.
	self assert: (betaEquation variable idExpression1 symbol) equals: #i.
	self assert: (betaEquation variable idExpression2 symbol) equals: #j
