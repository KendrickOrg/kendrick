as yet unclassified
testKECompartmentNode
	| input result visitor |
	input := KECompartment new status: #S.
	visitor := KendrickCPPVisitor new.
	result := visitor visitNode: input.
	self assert: result nbOfCompartments = 1.
	input := KECompartment new status: #I.
	result := visitor visitNode: input.
	self assert: (result compartments at: #I) = 1