evaluating
evaluateWithModel: aModel
	|expressionValue idInterval rs|
	idInterval := (aModel atParameter: (idVariable symbol)).
	expressionValue := Array new: (idInterval size).
	idInterval do: [ :id|
		
		"parameters at: (idVariable symbol) put: id."
		"ThanhNT 4-Aug-2017"
		"aModel addTemporalParameter: (idVariable symbol) value: id."
		"expressionValue at: id put: (functionExpr evaluateWithModel: aModel)"
		|tmp|
		tmp := self assignValue: id ForIndexVariable: functionExpr.
		expressionValue at: id put: (tmp evaluateWithModel: aModel)
		"Endof ThanhNT 4-Aug-2017"
		
		 ].
	(functionName = #sum) ifTrue: [
		rs := 0.
		expressionValue do: [:a| rs := rs + a]].
	^ rs