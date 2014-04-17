comparing
= aMathExpSigma

aMathExpSigma isExpressionWithSigmaMathFunction ifTrue:[
^(self functionName = aMathExpSigma functionName) and:
	[(self exprInFunction = aMathExpSigma exprInFunction) and:
	[self idVariable = aMathExpSigma idVariable]
	]
].
^false