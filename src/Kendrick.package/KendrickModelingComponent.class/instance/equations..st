public-api
equations: anArrayOfSymExpressions

	equations :=
		KendrickEquations new with: anArrayOfSymExpressions.
	backEndEntity addEquations: equations convertToCompatibleBackendRepresentation.
	