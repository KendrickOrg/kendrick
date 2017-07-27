comparing
= arg1
	arg1 isNumber
		ifTrue: [ ^ self = (KENumerical new number: arg1) ].
	arg1 isBinaryExpression
		ifTrue: [ ^ self op = arg1 op
				and: [ self leftHandSide = arg1 leftHandSide
						and: [ self rightHandSide = arg1 rightHandSide ] ] ].
	^ false