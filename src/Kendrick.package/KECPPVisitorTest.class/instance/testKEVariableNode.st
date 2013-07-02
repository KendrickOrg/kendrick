as yet unclassified
testKEVariableNode
	| input result visitor |
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1); numberOfSpecies: 1).
	input := KEVariable symbol: #S.
	result := visitor visitNode: input.
	self assert: result  = 'x(0, 0)'