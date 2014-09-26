as yet unclassified
init
	|model|
	model := self model.
	1 to: (model equations size) do: [ :i|
		|eqStr|
		eqStr := (model equations at: i) asString.
		model equations at: i put: (PPODEParserForNetworkModel parse: eqStr)
		 ]
	