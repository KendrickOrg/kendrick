as yet unclassified
executeOn: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 |
	super executeOn: arg1.
	tmp3 := tMin.
	tmp4 := tmp3.
	tmp5 := self class randPair.
	tmp1 := tmp5 key.
	tmp2 := tmp5 value.
	self saveCompartmentsValueAtTime: tMin.
	[ tmp3 < tMax ]
		whileTrue: [ tmp6 := nil.
			tmp7 := nil.
			tmp8 := nil.
			tmp7 := tmp1 next.
			tmp8 := tmp2 next.
			tmp6 := self
				doGillespieIteration: tmp3
				randoms: (Array with: tmp7 with: tmp8).
			tmp6 = 0.0
				ifTrue: [ ^ self ].
			tmp3 := tmp3 + tmp6.
			tmp3 > (tmp4 + step)
				ifTrue: [ self saveCompartmentsValueAtTime: tmp3.
					tmp4 := tmp3 ] ]