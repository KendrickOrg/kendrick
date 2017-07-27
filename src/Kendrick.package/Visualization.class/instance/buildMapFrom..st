as yet unclassified
buildMapFrom: arg1
	| tmp1 |
	tmp1 := (simulation compo concerns
		select: [ :arg2 | arg2 attributes keys includes: arg1 ]) first.
	diag countries: (tmp1 attributes at: arg1).
	tmp1 transitions
		do: [ :arg3 | diag routesFrom: arg3 key key toAll: {arg3 value} ]