tests
testCreateAnEventThatRemoveAnIndividualFromStatusS
	|e|
	e := KEEvent new.
	e removeOneIndividualFrom: #S.
	self assert: (e actions at: #S) equals: -1.
