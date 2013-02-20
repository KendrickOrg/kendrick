as yet unclassified
= aMathExp

aMathExp isMathExpression ifTrue:[
^(self function = aMathExp function) and:
	[self exprInFunction = aMathExp exprInFunction]
].
^false