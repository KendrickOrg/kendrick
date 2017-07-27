as yet unclassified
testKECompartmentNode
	| tmp1 tmp2 tmp3 tmp5 |
	tmp5 := KECompartment new.
	tmp5
		status: #S;
		initialValue: #(9999).
	tmp1 := tmp5 numberOfSpecies: 1.
	tmp3 := KECPPVisitor new.
	tmp2 := tmp3 visitNode: tmp1.
	self
		assert:
			tmp2
				=
					(String tab , 'compartmentName[0] = "S";' , String cr , String tab
						, 'initialValue[0][0] = 9999;' , String cr)