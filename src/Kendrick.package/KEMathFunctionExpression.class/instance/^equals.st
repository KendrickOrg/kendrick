comparing
= aMathExp
aMathExp isNumber ifTrue: [ ^ self = (KENumerical new number: aMathExp) ].
aMathExp isExpressionWithMathFunction ifTrue:[
^(self functionName = aMathExp functionName) and:
	[self functionExpr = aMathExp functionExpr]
].
^false