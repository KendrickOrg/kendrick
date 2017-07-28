as yet unclassified
doIBMIteration: t random: rand
	model t: t.
	(model population individuals select: [ :ind | ind isAlive ]) do: [ :ind | self calProb: ind random: rand ].
	self doBirthTransitions