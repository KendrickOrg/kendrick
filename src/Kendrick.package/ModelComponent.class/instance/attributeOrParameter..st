protected
attributeOrParameter: arg1
	| tmp1 tmp2 tmp3 |
	^ (parameters keys includes: arg1)
		ifTrue: [ backEndEntity atParameter: arg1 ]
		ifFalse: [ tmp1 := attributes associations
				select: [ :arg2 | arg2 value includes: arg1 ].
			tmp1 isEmpty
				ifTrue: [ (arg1 asString includes: $_)
						ifTrue: [ tmp2 := arg1 findTokens: '_'.
							(attributes keys includes: tmp2 first)
								ifTrue: [ backEndEntity
										sizeOfPopulation:
											(tmp2 collect: [ :arg4 | backEndEntity currentCompartment at: arg4 ])
												asArray ]
								ifFalse: [ tmp3 := backEndEntity currentCompartment at: tmp2 second.
									tmp1 := attributes associations
										select: [ :arg3 | arg3 value includes: tmp2 first ].
									backEndEntity
										atCompartment:
											{(tmp1 first key -> tmp2 first asSymbol).
											(tmp2 second -> tmp3)} ] ]
						ifFalse: [ backEndEntity
								sizeOfPopulation: (backEndEntity currentCompartment at: arg1 asSymbol) ] ]
				ifFalse: [ backEndEntity atCompartment: {(tmp1 first key -> arg1)} ] ]