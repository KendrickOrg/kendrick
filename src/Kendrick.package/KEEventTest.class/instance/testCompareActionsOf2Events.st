tests
testCompareActionsOf2Events
	|e1 e2|
	e1 := KEEvent new.
	e1 actions at: #S put: -1.
	e1 actions at: #I put: 1.
	e2 := KEEvent new.
	e2 actions at: #I put: 1.
	e2 actions at: #S put: -1.
	self assert: (e1 actions = e2 actions) equals: true