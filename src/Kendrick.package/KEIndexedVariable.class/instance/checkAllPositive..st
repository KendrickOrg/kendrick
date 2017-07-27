as yet unclassified
checkAllPositive: arg1
	| tmp2 |
	arg1 isNumber
		ifTrue: [ ^ arg1 > 0 ].
	arg1 isArray
		ifTrue: [ tmp2 := true.
			arg1
				do: [ :arg2 | 
					tmp2 := tmp2 & (self checkAllPositive: arg2).
					tmp2
						ifFalse: [ ^ tmp2 ] ].
			^ tmp2 ].
	^ false