as yet unclassified
= anExpression

anExpression isAnIndexedVariable
	ifTrue:[^(self symbol = anExpression symbol) and:
		[(self idExpression1 = anExpression idExpression1) and:
		[self idExpression2 = anExpression idExpression2]
		]
		].
^false