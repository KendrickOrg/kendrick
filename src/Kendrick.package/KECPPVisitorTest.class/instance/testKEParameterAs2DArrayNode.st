as yet unclassified
testKEParameterAs2DArrayNode
	| tmp1 tmp2 tmp4 |
	tmp2 := KECPPVisitor new.
	tmp4 := KEParameter new.
	tmp4 symbol: #beta.
	tmp1 := tmp2
		visitNode:
			(tmp4
				value:
					{{0 . 0.02 . 0.02}.
					{0.02 . 0 . 0}.
					{0.02 . 0 . 0}}).
	self
		assert:
			tmp1
				=
					('const double beta[3][3] = {{0.0, 0.02, 0.02}, {0.02, 0.0, 0.0}, {0.02, 0.0, 0.0}};'
						, String cr)