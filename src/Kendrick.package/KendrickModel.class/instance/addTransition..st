public-api
addTransition: arg1
	| tmp1 |
	tmp1 := KendrickTransitions new with: arg1.
	tmp1 convertToCompatibleBackendRepresentation
		do: [ :arg2 | 
			| tmp2 tmp3 tmp4 |
			tmp2 := arg2 key key asString asSymbol.
			tmp4 := arg2 key value.
			tmp3 := arg2 value asString asSymbol.
			self
				allTransitionsFor:
					{tmp2.
					tmp4.
					tmp3} ]