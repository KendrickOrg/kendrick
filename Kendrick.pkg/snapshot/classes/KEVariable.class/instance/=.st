
!KEVariable methodsFor: 'as yet unclassified'!
= anExpression

anExpression isAVariable
	ifTrue:[^self symbol = anExpression symbol].
^false.! !
