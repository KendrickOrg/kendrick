as yet unclassified
addCompositeParameter: arg1 value: arg2
	| tmp1 tmp2 |
	tmp1 := self entitiesFor: arg1 allButFirst.
	parameters at: arg1 put: arg2.
	(arg1 size >= 3 and: [ tmp1 second isEmpty ])
		ifTrue: [ ^ self addCompositeParameterWithTwoAttributes: arg1 value: arg2 ].
	backEndEntity
		addParameter: arg1 first asSymbol
		value: [ :arg3 | 
			| tmp3 tmp4 tmp5 tmp6 |
			tmp5 := tmp1 first first.
			tmp6 := tmp1 second.
			tmp3 := arg3 currentCompartment at: arg1 second.
			tmp4 := (tmp5 attributes at: arg1 second) indexOf: tmp3.
			tmp6 isEmpty
				ifTrue: [ arg2 at: tmp4 ]
				ifFalse:
					[ tmp3 := arg3 currentCompartment at: tmp6 first attributes keys first.
					tmp3 = arg1 last
						ifTrue: [ arg2 last ]
						ifFalse: [ arg2 at: tmp4 ] ] ]