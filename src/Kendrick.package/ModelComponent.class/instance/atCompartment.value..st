protected
atCompartment: arg1 value: arg2
	| tmp1 |
	tmp1 := (attributes associations
		select: [ :arg3 | arg3 value includes: arg1 ]) first.
	backEndEntity atCompartment: {(tmp1 key -> arg1)} put: arg2