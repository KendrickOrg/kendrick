as yet unclassified
= aExpression

(aExpression isUnaryExpression) ifTrue: [
	^(self expression compareWith: aExpression expression).
]
ifFalse:[^false]