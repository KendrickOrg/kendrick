accessing
get: aSymbol from: data do: aFunction
	|models|
	models := OrderedCollection new.
	data do: [ :each| models addLast: ((each at: aSymbol) do: aFunction)].
	^ models