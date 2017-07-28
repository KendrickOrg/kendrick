evaluating
= aNumerical
	aNumerical isNumber ifTrue: [ ^ self = (KENumerical new number: aNumerical) ].
	aNumerical isNumerical ifTrue: [ ^ self number = aNumerical number ].
	^ false
	