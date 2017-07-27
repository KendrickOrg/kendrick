as yet unclassified
testKEEquation
	| tmp1 tmp2 tmp3 tmp5 tmp7 tmp9 |
	tmp1 := PPODEParser parse: 'S:t=beta*S*I'.
	tmp3 := KECPPVisitor new.
	tmp5 := KECompartment new.
	tmp5
		status: #S;
		initialValue: #(1).
	tmp3 visitNode: (tmp5 numberOfSpecies: 1).
	tmp7 := KECompartment new.
	tmp7
		status: #I;
		initialValue: #(2).
	tmp3 visitNode: (tmp7 numberOfSpecies: 1).
	tmp9 := KEParameter new.
	tmp9 symbol: #beta.
	tmp3 visitNode: (tmp9 value: 0.0052).
	tmp2 := tmp3 visitNode: tmp1.
	self
		assert:
			tmp2 contents
				=
					(String tab , 'for (int i = 0; i < nbOfSpecies; i++)' , String cr
						, String tab , '{' , String cr , String tab , String tab
						, 'dxdt(0, i) = ((beta*x(0, 0))*x(1, 0));' , String cr
						, String tab , '}' , String cr)