as yet unclassified 
getIndexedExpressionForModel
	|expr var1 var2|
	var1 := KEIndexedVariable new symbol: #gamma; addIndex: (KEVariable new symbol: #i).
	var2 := KEIndexedVariable new symbol: #beta; addIndex: (KEVariable new symbol: #i).
	expr := KEBinaryExpression new op: #*.
	expr leftHandSide: var2.
	expr rightHandSide: var1.
	^expr.