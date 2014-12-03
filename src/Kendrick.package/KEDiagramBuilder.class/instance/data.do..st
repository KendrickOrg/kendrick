as yet unclassified
data: aCollection do: aFunction
	data := aCollection collect: [ :e| 
		((e key)->(e value perform: aFunction)) ].