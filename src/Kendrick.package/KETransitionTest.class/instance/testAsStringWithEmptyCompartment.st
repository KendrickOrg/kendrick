tests
testAsStringWithEmptyCompartment
	| tmp1 |
	tmp1 := KETransition
		from: #empty
		to: '{#status: #I}'
		probability: [ :arg1 :arg2 :arg3 | (arg3 atParameter: #beta) * arg1 * arg2 ].
	self
		assert: tmp1 asString = 'From: {#status->#empty} To: {#status->#I}'