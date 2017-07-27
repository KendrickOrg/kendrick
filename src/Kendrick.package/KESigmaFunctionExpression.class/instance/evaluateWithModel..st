evaluating
evaluateWithModel: arg1
	| tmp1 tmp2 tmp4 |
	tmp2 := arg1 atParameter: idVariable symbol.
	tmp1 := Array new: tmp2 size.
	tmp2
		do: [ :arg2 | 
			arg1 addTemporalParameter: idVariable symbol value: arg2.
			tmp1 at: arg2 put: (functionExpr evaluateWithModel: arg1) ].
	functionName = #sum
		ifTrue: [ tmp4 := 0.
			tmp1 do: [ :arg3 | tmp4 := tmp4 + arg3 ] ].
	^ tmp4