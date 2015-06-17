as yet unclassified
data: aCollection do: aFunction
	data := aCollection do:[ :ts|
		ts perform: aFunction]