as yet unclassified
testKEEquationWithFunctionSigmaInExpression
	| tmp1 tmp2 tmp3 tmp5 tmp7 tmp9 tmp11 tmp13 |
	tmp1 := PPODEParser
		parse: 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]'.
	tmp3 := KECPPVisitor new.
	tmp5 := KECompartment new.
	tmp5
		status: #S;
		initialValue: #(9999 1000 2000).
	tmp3 visitNode: (tmp5 numberOfSpecies: 3).
	tmp7 := KECompartment new.
	tmp7
		status: #I;
		initialValue: #(1 0 0).
	tmp3 visitNode: (tmp7 numberOfSpecies: 3).
	tmp9 := KEParameter new.
	tmp9 symbol: #beta.
	tmp3
		visitNode:
			(tmp9
				value:
					{{0 . 0.02 . 0.02}.
					{0.02 . 0 . 0}.
					{0.02 . 0 . 0}}).
	tmp11 := KEParameter new.
	tmp11 symbol: #N.
	tmp3 visitNode: (tmp11 value: #(10000 1000 2000)).
	tmp13 := KEParameter new.
	tmp13 symbol: #mu.
	tmp3
		visitNode:
			(tmp13
				value:
					{(365 / 30).
					(1 / 20).
					(1 / 20)}).
	tmp2 := tmp3 visitNode: tmp1.
	self
		assert:
			tmp2 contents
				=
					(String tab , 'for (int i = 0; i < nbOfSpecies; i++)' , String cr
						, String tab , '{' , String cr , String tab , String tab
						, 'double sumSigma = 0.0;' , String cr , String tab , String tab
						, 'for (int j = 0; j < nbOfSpecies; j++)' , String cr
						, String tab , String tab , String tab
						, 'sumSigma += (beta[i][j]*x(1, j));' , String cr , String tab
						, String tab
						, 'dxdt(0, i) = (((mu[i]*N[i])-(sumSigma*x(0, i)))-(mu[i]*x(0, i)));'
						, String cr , String tab , '}' , String cr)