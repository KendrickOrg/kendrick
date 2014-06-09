comparing
= aExpression

(aExpression isUnaryExpression) ifTrue: [
	^(self expression = aExpression expression).
]
ifFalse:[^false]