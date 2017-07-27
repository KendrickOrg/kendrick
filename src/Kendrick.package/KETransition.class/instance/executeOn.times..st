accessing
executeOn: arg1 times: arg2
	| tmp1 tmp2 |
	(from at: #status) = #empty
		ifFalse: [ tmp1 := arg1 population compartments at: from.
			tmp2 := tmp1 - arg2.
			tmp2 := tmp2 max: 0.
			arg1 population compartments at: from put: tmp2 ].
	(to at: #status) = #empty
		ifTrue: [ ^ self ].
	tmp1 := arg1 population compartments at: to.
	tmp2 := tmp1 + arg2.
	arg1 population compartments at: to put: tmp2