as yet unclassified
evaluateWithModel: m
	|index1 index2 x|
	index1 := idExpression1 evaluateWithModel: m.
	index2 := idExpression2 evaluateWithModel: m.
	(index2 = -1) ifTrue: [
		(index1 <= 0) ifTrue: [^0].
		x := (m atParameter: symbol at: index1).
		x ifNil: [x := ((m atCompartment: symbol) numberOfIndividuals) at: index1]
		] ifFalse: [
			((index1 <= 0) | (index2 <= 0)) ifTrue: [^0].
			x := (m atParameter: symbol at: index1 at: index2).
		].
"self halt."
^x
