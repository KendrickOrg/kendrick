tests
testAsStringWithEmptyCompartment
	| aTransition |
	aTransition := KETransition
		from: #empty
		to: '{#status: #I}'
		probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString = 'From: empty To: {#status->#I}'