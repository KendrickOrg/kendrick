as yet unclassified
testKEParameterAs3DArrayNode
	| tmp1 tmp2 tmp4 |
	tmp2 := KECPPVisitor new.
	tmp4 := KEParameter new.
	tmp4 symbol: #mu.
	tmp1 := tmp2
		visitNode: (tmp4 value: #(#(#(1 2) #(1 2)) #(#(3 4) #(3 4)))).
	self
		assert:
			tmp1
				=
					('const double mu[2][2][2] = {{{1.0, 2.0}, {1.0, 2.0}}, {{3.0, 4.0}, {3.0, 4.0}}};'
						, String cr)