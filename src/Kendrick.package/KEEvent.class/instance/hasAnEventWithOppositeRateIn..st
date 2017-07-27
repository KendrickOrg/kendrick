accessing
hasAnEventWithOppositeRateIn: arg1
	^ arg1 anySatisfy: [ :arg2 | arg2 rate negated = self rate ]