
!KEUnaryExpression methodsFor: 'as yet unclassified'!
= aExpression

(aExpression isUnaryExpression) ifTrue: [
	^(self expression = aExpression expression).
]
ifFalse:[^false]! !
