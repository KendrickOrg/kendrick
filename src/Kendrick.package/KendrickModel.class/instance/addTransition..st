public-api
addTransition: symExpression

	|newTransition| 

	newTransition :=
		KendrickTransitions new with: symExpression.
	newTransition convertToCompatibleBackendRepresentation do: [:assoc |
		|from to propability|
		from := assoc key key asString asSymbol.
		propability := assoc key value.
		to := assoc value asString asSymbol.
		self allTransitionsFor: { from . propability . to } ].