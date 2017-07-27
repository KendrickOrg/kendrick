evaluating
= arg1
	arg1 isNumber
		ifTrue: [ ^ self = (KENumerical new number: arg1) ].
	arg1 isNumerical
		ifTrue: [ ^ self number = arg1 number ].
	^ false