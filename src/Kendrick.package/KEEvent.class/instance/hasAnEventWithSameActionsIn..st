accessing
hasAnEventWithSameActionsIn: arg1
	^ arg1 anySatisfy: [ :arg2 | arg2 actions = self actions ]