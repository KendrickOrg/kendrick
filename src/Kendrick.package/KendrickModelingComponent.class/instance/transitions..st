public-api
transitions: arg1
	transitions := KendrickTransitions new with: arg1.
	transitions convertToCompatibleBackendRepresentation
		do: [ :arg2 | 
			| tmp1 tmp2 tmp3 |
			tmp1 := arg2 key key asString asSymbol.
			tmp3 := arg2 key value.
			tmp2 := arg2 value asString asSymbol.
			self
				allTransitionsFor:
					{tmp1.
					tmp3.
					tmp2} ]