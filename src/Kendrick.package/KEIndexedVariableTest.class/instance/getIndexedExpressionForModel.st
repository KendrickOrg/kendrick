as yet unclassified 
getIndexedExpressionForModel
	| tmp1 tmp2 tmp3 tmp5 tmp7 |
	tmp5 := KEIndexedVariable new.
	tmp5 symbol: #gamma.
	tmp2 := tmp5 addIndex: (KEVariable new symbol: #i).
	tmp7 := KEIndexedVariable new.
	tmp7 symbol: #beta.
	tmp3 := tmp7 addIndex: (KEVariable new symbol: #i).
	tmp1 := KEBinaryExpression new op: #*.
	tmp1
		leftHandSide: tmp3;
		rightHandSide: tmp2.
	^ tmp1