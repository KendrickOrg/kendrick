
!KEBinaryExpression methodsFor: 'as yet unclassified'!
= anExpression

anExpression isBinaryExpression ifTrue:[
^(self op = anExpression op) and:
	[self leftHandSide = anExpression leftHandSide
		and:[self rightHandSide = anExpression rightHandSide]
	]
].
^false! !
