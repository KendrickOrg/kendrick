public-api
doesNotUnderstand: arg1
	| tmp1 tmp2 |
	tmp1 := arg1 selector.
	tmp1 := (tmp1 asString trimRight: [ :arg2 | arg2 = $: ]) asSymbol.
	tmp2 := arg1 arguments first.
	(self attributeValuesIncludes: tmp1)
		ifTrue: [ explicitelySetCompartments add: tmp1.
			self atCompartment: tmp1 value: tmp2 ]
		ifFalse: [ (parameters keys includes: tmp1)
				ifTrue: [ parameters at: tmp1 put: tmp2.
					self addParameter: tmp1 value: tmp2 ]
				ifFalse: [ KendrickDSLSyntaxError
						signal: 'Undefined Variable Being Set: ' , tmp1 asString ] ]