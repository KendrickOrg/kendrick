tests
testAsString
	| aTransition |
	aTransition := KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString = 'From: {#status->#S} To: {#status->#I}'