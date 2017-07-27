comparing
= arg1
	arg1 isNumber
		ifTrue: [ ^ self = (KENumerical new number: arg1) ].
	arg1 isAnIndexedVariable
		ifTrue: [ ^ self symbol = arg1 symbol and: [ self indexList = arg1 indexList ] ].
	^ false