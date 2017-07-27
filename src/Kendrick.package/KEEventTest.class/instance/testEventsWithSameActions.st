tests
testEventsWithSameActions
	| tmp1 tmp2 tmp3 tmp5 tmp7 |
	tmp1 := KEEvent new.
	tmp2 := KEEvent new.
	tmp5 := tmp1 actions.
	tmp5
		at: #S put: 1;
		at: #I put: -1.
	tmp7 := tmp2 actions.
	tmp7
		at: #I put: -1;
		at: #S put: 1.
	tmp3 := OrderedCollection new.
	tmp3 add: tmp1.
	self assert: true equals: (tmp2 hasAnEventWithSameActionsIn: tmp3)