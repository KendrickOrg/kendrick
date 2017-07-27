utilities
crossProduct: arg1
	| tmp2 |
	tmp2 := [ :arg2 :arg3 | 
	| tmp3 |
	arg3 isEmpty
		ifTrue: [ Array with: arg2 ]
		ifFalse: [ tmp3 := arg3 allButFirst: 1.
			arg3 first
				inject: #()
				into: [ :arg4 :arg5 | arg4 , (tmp2 value: (arg2 copyWith: arg5) value: tmp3) ] ] ].
	^ tmp2 value: #() value: arg1