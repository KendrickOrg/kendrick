tests
testAsStringWithEmptyCompartment
	| aTransition |
	aTransition := KETransition
		from: #empty
		to: '{#status: #I}'
		probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString = 'From: {#status->#empty} To: {#status->#I}'