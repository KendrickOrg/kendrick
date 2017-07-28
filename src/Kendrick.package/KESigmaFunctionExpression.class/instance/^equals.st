comparing
= aMathExpSigma
aMathExpSigma isNumber ifTrue: [ ^ self = (KENumerical new number: aMathExpSigma) ].
aMathExpSigma isExpressionWithSigmaMathFunction ifTrue:[
^(self functionName = aMathExpSigma functionName) and:
	[(self functionExpr = aMathExpSigma functionExpr) and:
	[self idVariable = aMathExpSigma idVariable]
	]
].
^false