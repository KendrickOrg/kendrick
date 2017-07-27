as yet unclassified
convertToCompatibleBackendRepresentation
	^ ((eqAsSymExpr asString copyReplaceAll: '#' with: '' asTokens: false)
		trimBoth: [ :arg1 | arg1 = $( | (arg1 = $)) ]) findTokens: '''.'''