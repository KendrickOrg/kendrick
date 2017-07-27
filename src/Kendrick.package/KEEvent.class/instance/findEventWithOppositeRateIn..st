accessing
findEventWithOppositeRateIn: arg1
	^ arg1 detect: [ :arg2 | arg2 rate negated = rate ] ifNone: [  ]