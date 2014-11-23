as yet unclassified
adaptTo: aModel
	|model|
	self atArgument: #model put: aModel.
	model := self model.
	1 to: (model equations size) do: [ :i|
		|eqStr|
		eqStr := (model equations at: i) asString.
		model equations at: i put: (PPODEParserForNetworkModel parse: eqStr)
		 ]
	