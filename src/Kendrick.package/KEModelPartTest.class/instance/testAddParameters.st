tests-as yet unclassified
testAddParameters
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1 addParameters: {#beta . #gamma}.
	self assert: tmp1 parameters size equals: 2