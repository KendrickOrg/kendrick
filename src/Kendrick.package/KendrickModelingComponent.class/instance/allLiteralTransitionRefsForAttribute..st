public-api
allLiteralTransitionRefsForAttribute: arg1
	^ [ (attributes at: arg1) collect: [ :arg2 | arg1 -> arg2 ] ]
		on: KeyNotFound
		do: [ self literalTransitionRefFor: arg1 ]