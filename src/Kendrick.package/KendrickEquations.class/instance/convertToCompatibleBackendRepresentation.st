as yet unclassified
convertToCompatibleBackendRepresentation

	^ ((eqAsSymExpr asString
			copyReplaceAll: '#' with: '' asTokens: false)
			trimBoth: [ :c | (c = $() | (c = $)) ]) 
			findTokens: '''.'''