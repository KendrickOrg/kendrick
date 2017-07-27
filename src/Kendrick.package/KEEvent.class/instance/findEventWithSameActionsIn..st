accessing
findEventWithSameActionsIn: arg1
	^ arg1 detect: [ :arg2 | arg2 actions = actions ] ifNone: [  ]