tests-as yet unclassified
testAddParameter
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1 addParameter: #beta.
	self assert: tmp1 parameters size equals: 1