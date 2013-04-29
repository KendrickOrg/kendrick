as yet unclassified
testKECompartmentNode
	| input result visitor |
	input := (KECompartment new status: #S; numberOfIndividuals: #(9999)).
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	self assert: result = ('compartmentName[0] = "S";', String cr, 'initialValue[0] = 9999;', String cr).
	input := KECompartment new status: #I; numberOfIndividuals: #(1).
	result := visitor visitNode: input.
	self assert: result = ('compartmentName[1] = "I";', String cr, 'initialValue[1] = 1;', String cr).
