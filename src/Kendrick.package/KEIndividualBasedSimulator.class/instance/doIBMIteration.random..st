as yet unclassified
doIBMIteration: t random: rand
	model t: t.
	model population individuals do: [ :ind|
		"model parameters at: #individual put: ind."
		(ind attributes at: #alive) ifTrue: [ self calProb: ind random: rand ]
		 ].
	self doBirthTransitions