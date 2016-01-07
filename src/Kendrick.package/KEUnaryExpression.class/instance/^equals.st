comparing
= anExpression
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
(anExpression isUnaryExpression) ifTrue: [
	^(self expression = anExpression expression).
]
ifFalse:[^false]