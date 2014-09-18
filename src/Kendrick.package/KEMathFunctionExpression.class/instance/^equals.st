as yet unclassified
= aMathExp

aMathExp isExpressionWithMathFunction ifTrue:[
^(self functionName = aMathExp functionName) and:
	[self functionExpr = aMathExp functionExpr]
].
^false