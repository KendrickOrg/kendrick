tests
testKENumberPrintAsNumber
	| n |
	n := KENumerical number: 10.
	self assert: n asString equals: '10'