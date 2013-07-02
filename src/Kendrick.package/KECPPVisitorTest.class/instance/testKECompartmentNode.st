as yet unclassified
testKECompartmentNode
	| input result visitor |
	input := (KECompartment new status: #S; initialValue:  #(9999); numberOfSpecies: 1).
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = (String tab,'compartmentName[0] = "S";', String cr, String tab, 'initialValue[0][0] = 9999;', String cr).
	
	