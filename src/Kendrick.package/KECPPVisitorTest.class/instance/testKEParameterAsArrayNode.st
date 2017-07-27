as yet unclassified
testKEParameterAsArrayNode
	| tmp1 tmp2 tmp4 tmp6 |
	tmp2 := KECPPVisitor new.
	tmp4 := KEParameter new.
	tmp4 symbol: #N.
	tmp1 := tmp2 visitNode: (tmp4 value: {1000 . 2000 . 3000}).
	self
		assert: tmp1 = ('const double N[3] = {1000.0, 2000.0, 3000.0};' , String cr).
	tmp6 := KEParameter new.
	tmp6 symbol: #mu.
	tmp1 := tmp2
		visitNode:
			(tmp6
				value:
					{(365 / 30).
					(1 / 20).
					(1 / 20)}).
	self
		assert:
			tmp1
				= ('const double mu[3] = {12.166666666666666, 0.05, 0.05};' , String cr)