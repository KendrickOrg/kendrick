comparing
= anExpression
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
anExpression isAVariable
	ifTrue:[^self symbol = anExpression symbol].
^false