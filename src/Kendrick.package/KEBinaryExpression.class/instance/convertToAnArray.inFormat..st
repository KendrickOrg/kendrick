private
convertToAnArray: arg1 inFormat: arg2
	| tmp1 |
	arg1 isArray
		ifTrue: [ ^ arg1 ].
	arg1 isNumber
		ifTrue: [ tmp1 := arg2 clone.
			self fromNumber: arg1 to: tmp1.
			^ tmp1 ].
	^ nil