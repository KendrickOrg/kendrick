as yet unclassified
testKEVariableNode
	| input result|
	input := KEVariable symbol: #a.
	result := KendrickCPPVisitor new visitNode: input.
	
	self assert: result contents = 'a'.
	