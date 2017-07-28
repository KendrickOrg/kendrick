tests-as yet unclassified
testAddParameters
	|c|
	c := KEModelPart new.
	c addParameters: {#beta. #gamma}.
	self assert: c parameters size equals: 2