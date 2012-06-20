as yet unclassified
evaluateWithModel: aModel

| expressionValue idInterval rs|
idInterval := (aModel atParameter: (idVariable value asSymbol)).
expressionValue := Array new: (idInterval size).
aModel fnIdVariable: idVariable.
idInterval do: [:id|
	aModel fnIdValue: id.	
	expressionValue at: id put: (exprInFunction evaluateWithModel: aModel).
	].

(function = #sum) ifTrue: [
	rs := 0.
	expressionValue do: [:a| rs := rs + a]].
^rs.
