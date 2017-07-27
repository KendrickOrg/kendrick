tests
testCreateAnEventThatRemoveAnIndividualFromStatusS
	| tmp1 |
	tmp1 := KEEvent new.
	tmp1 removeOneIndividualFrom: #S.
	self assert: (tmp1 actions at: #S) equals: -1