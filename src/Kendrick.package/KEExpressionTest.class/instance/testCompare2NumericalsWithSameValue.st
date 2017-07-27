tests
testCompare2NumericalsWithSameValue
	| tmp1 tmp2 |
	tmp1 := KENumerical number: 6.
	tmp2 := KENumerical number: 6.
	self assert: true equals: tmp1 = tmp2