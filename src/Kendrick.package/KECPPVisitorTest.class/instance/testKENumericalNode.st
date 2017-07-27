as yet unclassified
testKENumericalNode
	| tmp1 tmp2 |
	tmp1 := KENumerical number: 1.
	tmp2 := KECPPVisitor new visitNode: tmp1.
	self assert: tmp2 contents = '1'