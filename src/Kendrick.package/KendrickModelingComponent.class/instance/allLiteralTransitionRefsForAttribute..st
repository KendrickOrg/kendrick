public-api
allLiteralTransitionRefsForAttribute: attribute
	
	^ [(attributes at: attribute) collect: [:comp |  attribute  -> comp ]] on: KeyNotFound do: [ self literalTransitionRefFor: attribute ]