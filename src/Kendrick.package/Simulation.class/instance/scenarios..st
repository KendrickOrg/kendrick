public-api
scenarios: arg1
	scenarios := arg1 collect: [ :arg2 | Scenario withId: arg2 ].
	combo := scenarios last composition