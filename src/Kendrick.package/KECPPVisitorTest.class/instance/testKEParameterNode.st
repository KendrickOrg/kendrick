as yet unclassified
testKEParameterNode
	| tmp1 tmp2 tmp3 tmp5 |
	tmp3 := KECPPVisitor new.
	tmp5 := KEParameter new.
	tmp5 symbol: #beta.
	tmp2 := tmp3 visitNode: (tmp5 value: 0.0052).
	self assert: tmp2 = ('const double beta = 0.0052;' , String cr)