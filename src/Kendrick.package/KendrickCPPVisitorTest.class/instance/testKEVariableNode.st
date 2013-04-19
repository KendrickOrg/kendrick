as yet unclassified
testKEVariableNode
	| input result visitor |
	visitor := KendrickCPPVisitor new.
	visitor visitNode: (KECompartment new status: #S).
	input := KEVariable symbol: #S.
	result := visitor visitNode: input.
	self assert: result contents = 'x[0]'