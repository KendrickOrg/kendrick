tests
testAsString
	| tmp1 |
	tmp1 := KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :arg1 :arg2 :arg3 | (arg3 atParameter: #beta) * arg1 * arg2 ].
	self assert: tmp1 asString = 'From: {#status->#S} To: {#status->#I}'