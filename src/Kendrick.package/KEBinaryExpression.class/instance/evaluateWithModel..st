evaluating
evaluateWithModel: arg1
	| tmp1 tmp2 |
	tmp1 := leftHandSide evaluateWithModel: arg1.
	tmp2 := rightHandSide evaluateWithModel: arg1.
	tmp1 isArray | tmp2 isArray
		ifTrue: [ tmp1 isNumber
				ifTrue: [ tmp1 := self convertToAnArray: tmp1 inFormat: tmp2 ].
			tmp2 isNumber
				ifTrue: [ tmp2 := self convertToAnArray: tmp2 inFormat: tmp1 ].
			^ self calculateArraysBetween: tmp1 with: tmp2 ].
	op = #+
		ifTrue: [ ^ tmp1 + tmp2 ].
	op = #*
		ifTrue: [ ^ tmp1 * tmp2 ].
	op = #/
		ifTrue: [ ^ tmp1 / tmp2 ].
	op = #-
		ifTrue: [ ^ tmp1 - tmp2 ].
	op = #'^'
		ifTrue: [ ^ tmp1 raisedTo: tmp2 ]