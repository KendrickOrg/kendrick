as yet unclassified
= anExpression

anExpression isAnIndexedVariable
	ifTrue:[^(self symbol = anExpression symbol) and:
		[ self indexList = anExpression indexList ]
		].
^false