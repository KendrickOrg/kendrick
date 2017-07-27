public-api
splitStatus: arg1
	| tmp1 tmp2 |
	tmp1 := arg1 copyFrom: 1 to: (arg1 indexOf: #index) - 1.
	tmp2 := arg1 last.
	tmp2
		do: [ :arg2 | 
			tmp1
				do: [ :arg3 | (attributes at: #status) add: (arg3 asString , arg2 asString) asSymbol ] ].
	backEndEntity
		transitions:
			(self allHierarchyTransitions
				select: [ :arg4 | 
					(tmp1 includes: (arg4 from at: #status))
						| (tmp1 includes: (arg4 to at: #status)) ]);
		splitStatus:
			{tmp1.
			(arg1 second -> tmp2)}