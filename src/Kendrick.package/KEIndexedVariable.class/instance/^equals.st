as yet unclassified
= anExpression
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
anExpression isAnIndexedVariable
	ifTrue:[^(self symbol = anExpression symbol) and:
		[ self indexList = anExpression indexList ]
		].
^false