evaluating
evaluateWithModel: arg1
	| tmp1 |
	tmp1 := functionExpr evaluateWithModel: arg1.
	functionName = #sin
		ifTrue: [ ^ tmp1 sin ].
	functionName = #cos
		ifTrue: [ ^ tmp1 cos ].
	functionName = #log
		ifTrue: [ ^ tmp1 log ].
	functionName = #exp
		ifTrue: [ ^ tmp1 exp ]