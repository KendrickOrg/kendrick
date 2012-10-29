as yet unclassified
= aMathExpSigma

aMathExpSigma isMathExpressionSigma ifTrue:[
^(self function = aMathExpSigma function) and:
	[(self exprInFunction = aMathExpSigma exprInFunction) and:
	[self idVariable = aMathExpSigma idVariable]
	]
].
^false