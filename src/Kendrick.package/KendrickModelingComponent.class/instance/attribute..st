public-api
attribute: arg1
	attributes
		at: arg1 first
		put:
			((arg1 allButFirst select: [ :arg2 | arg2 ~= #-> ])
				collect: [ :arg3 | arg3 asString asSymbol ]) asOrderedCollection.
	backEndEntity
		addAttribute: arg1 first
		value:
			((arg1 allButFirst select: [ :arg4 | arg4 ~= #-> ])
				collect: [ :arg5 | arg5 asString asSymbol ])