
!KEUnaryExpression methodsFor: 'as yet unclassified'!
sign

^ (op symbol value = '-')
	ifTrue: [^expression sign negated]
	ifFalse:[^expression sign]! !
