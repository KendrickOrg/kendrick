tests
testCreateAnEventThatAddAnIndividualFromStatusS
	|e|
	e := KEEvent new.
	e addOneIndividualTo: #S.
	self assert: (e actions at: #S) equals: 1.
