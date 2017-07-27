comparing
= arg1
	arg1 isNumber
		ifTrue: [ ^ self = (KENumerical new number: arg1) ].
	arg1 isAVariable
		ifTrue: [ ^ self symbol = arg1 symbol ].
	^ false