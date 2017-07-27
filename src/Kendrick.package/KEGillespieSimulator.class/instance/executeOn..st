public
executeOn: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
	super executeOn: arg1.
	tmp3 := tMin.
	tmp4 := tmp3.
	tmp1 := Random new.
	tmp2 := Random new.
	self saveCompartmentsValueAtTime: tMin.
	[ tmp3 < tMax ]
		whileTrue: [ tmp5 := nil.
			tmp6 := nil.
			tmp7 := nil.
			tmp6 := tmp1 next.
			tmp7 := tmp2 next.
			tmp5 := self
				doGillespieIteration: tmp3
				randoms: (Array with: tmp6 with: tmp7).
			tmp5 = 0.0
				ifTrue: [ ^ self ].
			tmp3 := tmp3 + tmp5.
			tmp3 > (tmp4 + step)
				ifTrue: [ self saveCompartmentsValueAtTime: tmp3.
					tmp4 := tmp3 ] ]