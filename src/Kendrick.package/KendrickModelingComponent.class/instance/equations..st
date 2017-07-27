public-api
equations: arg1
	equations := KendrickEquations new with: arg1.
	backEndEntity
		addEquations: equations convertToCompatibleBackendRepresentation