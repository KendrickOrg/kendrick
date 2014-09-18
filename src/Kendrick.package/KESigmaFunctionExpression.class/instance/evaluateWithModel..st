as yet unclassified
evaluateWithModel: aModel
	|expressionValue idInterval rs|
	idInterval := (aModel atParameter: (idVariable symbol)).
	expressionValue := Array new: (idInterval size).
	idInterval do: [ :id|
		"parameters at: (idVariable symbol) put: id."
		aModel addTemporalParameter: (idVariable symbol) value: id.
		expressionValue at: id put: (functionExpr evaluateWithModel: aModel)
		 ].
	(functionName = #sum) ifTrue: [
		rs := 0.
		expressionValue do: [:a| rs := rs + a]].
	^ rs