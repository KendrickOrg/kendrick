
!KEUnaryExpression methodsFor: 'as yet unclassified'!
compareWith: aExpression

(aExpression isUnaryExpression) ifTrue: [
	^(self expression compareWith: aExpression expression).
]
ifFalse:[^false]! !
