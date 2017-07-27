tests
testAddParameterValue
	| tmp1 |
	tmp1 := KEModel new.
	tmp1 addParameter: #beta value: 0.02.
	self assert: (tmp1 atParameter: #beta) equals: 0.02