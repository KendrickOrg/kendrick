as yet unclassified
contactsOf: arg1
	| tmp1 tmp3 |
	tmp1 := arg1 first.
	tmp3 := 0.
	self adjacentNodes
		do: [ :arg2 | 
			| tmp4 tmp5 |
			tmp4 := Dictionary new.
			arg1 size > 1
				ifTrue: [ tmp5 := arg1 size.
					2 to: tmp5 do: [ :tmp6 | tmp4 at: (arg1 at: tmp6) key put: (arg1 at: tmp6) value ] ].
			tmp4 at: #node put: arg2.
			tmp3 := tmp3 + (self sumAll: (tmp1 atCompartment: tmp4)) ].
	^ tmp3