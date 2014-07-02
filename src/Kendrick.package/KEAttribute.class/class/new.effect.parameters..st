as yet unclassified
new: attribute effect: block parameters: parameterCollection
	|params|
	params := Dictionary new.
	parameterCollection do: [ :each|
		params at: (#first value: each) put: (#second value: each)
		 ].
	^ super new symbol: attribute; effect: block; parameters: params