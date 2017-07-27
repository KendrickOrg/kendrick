as yet unclassified
addCompositeParameterWithTwoAttributes: arg1 value: arg2
	| tmp1 tmp2 tmp3 |
	tmp2 := (self entitiesFor: {arg1 second}) first first.
	tmp3 := (self entitiesFor: {arg1 third}) first first.
	backEndEntity
		addParameter: arg1 first asSymbol
		value: [ :arg3 | 
			| tmp4 tmp5 tmp6 tmp7 |
			tmp4 := arg3 currentCompartment at: arg1 second.
			arg1 last asSymbol = 'next'
				ifTrue: [ tmp5 := arg3 nextCompartment at: arg1 third ]
				ifFalse: [ tmp5 := arg3 currentCompartment at: arg1 third ].
			tmp6 := (tmp2 attributes at: arg1 second) indexOf: tmp4.
			tmp7 := (tmp3 attributes at: arg1 third) indexOf: tmp5.
			(arg2 at: tmp6) at: tmp7 ]