as yet unclassified
evaluateWithModel: arg1
	| tmp1 |
	tmp1 := expression evaluateWithModel: arg1.
	op = #-
		ifTrue: [ ^ tmp1 negated ]