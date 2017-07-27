accessing
atStatus: arg1 put: arg2
	| tmp1 tmp2 tmp3 |
	(self atAttribute: #status)
		ifNil: [ ^ self error: 'The model does not contain the attribute #status' ].
	((self atAttribute: #status) includes: arg1)
		ifFalse: [ ^ self
				error: 'THe model does not contain the status' , arg1 asString ].
	self initCompartments
		ifNil: [ initCompartments := Dictionary
				newFrom: (self compartmentNames collect: [ :arg3 | arg3 -> 0 ]) ].
	population initialSize < (initCompartments values sum + arg2)
		ifTrue: [ ^ self
				error: 'Total size of compartments is greater than the population size' ].
	tmp2 := initCompartments keys
		select: [ :arg4 | (arg4 at: #status) = arg1 ].
	tmp1 := tmp2 size.
	arg2 \\ tmp1 > 0
		ifTrue: [ tmp3 := arg2 \\ tmp1.
			1 to: tmp3 do: [ :tmp4 | initCompartments at: (tmp2 at: tmp4) put: arg2 // tmp1 + 1 ] ].
	tmp3 := tmp1.
	arg2 \\ tmp1 + 1 to: tmp3 do: [ :tmp4 | initCompartments at: (tmp2 at: tmp4) put: arg2 // tmp1 ].
	population compartments: initCompartments