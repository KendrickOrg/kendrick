as yet unclassified
testKENumericalNode
	| input result|
	input := KENumerical number: 1.
	result := KendrickCPPVisitor new visitNode: input.
	
	self assert: result contents = '1'.
	