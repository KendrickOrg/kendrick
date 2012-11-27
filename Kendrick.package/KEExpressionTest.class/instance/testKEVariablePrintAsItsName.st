tests
testKEVariablePrintAsItsName
	| beta |
	beta := KEVariable symbol: #beta.
	self assert: beta asString equals: 'beta'