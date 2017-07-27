private
calculateArraysBetween: arg1 with: arg2
	| tmp1 tmp3 |
	tmp3 := 0.
	tmp1 := arg1 clone.
	tmp1
		do: [ :arg3 | 
			| tmp4 |
			tmp3 := tmp3 + 1.
			tmp4 := OrderedCollection new.
			tmp4 add: tmp3.
			self
				calculate: arg3
				with: arg2
				at: tmp4
				andStoreIn: tmp1 ].
	^ tmp1