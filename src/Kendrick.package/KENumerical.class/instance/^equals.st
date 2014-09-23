evaluating
= aNumerical
	aNumerical isNumerical ifTrue: [ ^ self number = aNumerical number ].
	^ false
	