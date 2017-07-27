comparing
= arg1
	arg1 isNumber
		ifTrue: [ ^ self = (KENumerical new number: arg1) ].
	arg1 isUnaryExpression
		ifTrue: [ ^ self expression = arg1 expression ].
	^ false