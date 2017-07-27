tests
testCompareActionsOf2Events
	| tmp1 tmp2 |
	tmp1 := KEEvent new.
	tmp1 actions
		at: #S put: -1;
		at: #I put: 1.
	tmp2 := KEEvent new.
	tmp2 actions
		at: #I put: 1;
		at: #S put: -1.
	self assert: tmp1 actions = tmp2 actions equals: true