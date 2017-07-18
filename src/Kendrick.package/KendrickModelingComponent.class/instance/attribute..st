public-api
attribute: anArray

	attributes 
		at: anArray first 
		put: ((anArray allButFirst select: [:var | var ~= #->]) collect: [ :var | var asString asSymbol]) asOrderedCollection.
	backEndEntity 
		addAttribute: anArray first 
		value: ((anArray allButFirst select: [:var | var ~= #->]) collect: [ :var | var asString asSymbol]). 
	