tests-as yet unclassified
testAddParameterValue
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1 addParameter: #beta value: 0.05.
	self assert: tmp1 parameters size equals: 1