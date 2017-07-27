as yet unclassified
doIBMIteration: arg1 random: arg2
	model t: arg1.
	(model population individuals select: [ :arg3 | arg3 isAlive ])
		do: [ :arg4 | self calProb: arg4 random: arg2 ].
	self doBirthTransitions