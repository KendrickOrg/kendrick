as yet unclassified
doIBMIteration: t
	model parameters at: #t put: t.
	model population individuals do: [ :ind|
		(ind attributes at: #alive) ifTrue: [ self calProb: ind ]
		 ].
	self doBirthTransitions