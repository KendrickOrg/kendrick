as yet unclassified
evaluateWithModel: aModel withTemporalParameters: parameters
	|expressionValue idInterval rs|
	idInterval := (aModel atParameter: (idVariable symbol)).
	expressionValue := Array new: (idInterval size).
	idInterval do: [ :id|
		parameters at: (idVariable symbol) put: id.
		expressionValue at: id put: (exprInFunction evaluateWithModel: aModel withTemporalParameters: parameters)
		 ].
	(functionName = #sum) ifTrue: [
		rs := 0.
		expressionValue do: [:a| rs := rs + a]].
	^ rs
