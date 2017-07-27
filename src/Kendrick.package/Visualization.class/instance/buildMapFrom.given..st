as yet unclassified
buildMapFrom: arg1 given: arg2
	| tmp1 tmp2 |
	tmp1 := (simulation compo concerns
		select: [ :arg3 | arg3 attributes keys includes: arg1 ]) first.
	tmp2 := (arg2
		collect: [ :arg4 | 
			(arg4 select: [ :arg5 | arg5 key asSymbol = arg1 asSymbol ])
				collect: #value ]) flatten.
	diag countries: (tmp1 attributes at: arg1).
	tmp1 transitions
		do: [ :arg6 | diag routesFrom: arg6 key key toAll: {arg6 value} ]