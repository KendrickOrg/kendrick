as yet unclassified
doIBMIteration: t random: rand
	model t: t.
	model population individuals do: [ :ind | self calProb: ind random: rand ].
	self doBirthTransitions