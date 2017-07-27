private
calculate: arg1 with: arg2 at: arg3 andStoreIn: arg4
	| tmp2 tmp3 tmp4 tmp5 tmp6 |
	arg1 isNumber
		ifTrue: [ tmp2 := arg2.
			tmp2 isNumber
				ifFalse: [ arg3 do: [ :arg5 | tmp2 := tmp2 at: arg5 ] ].
			tmp4 := arg4.
			tmp3 := 0.
			arg3 size = 1
				ifTrue: [ tmp4 at: (arg3 at: 1) put: (self operateBetween: arg1 and: tmp2) ]
				ifFalse: [ arg3
						do: [ :arg6 | 
							tmp3 := tmp3 + 1.
							tmp4 := tmp4 at: arg6.
							tmp3 = (arg3 size - 1)
								ifTrue: [ tmp4
										at: (arg3 at: tmp3 + 1)
										put: (self operateBetween: arg1 and: tmp2) ] ] ] ]
		ifFalse: [ tmp5 := 0.
			arg1
				do: [ :arg7 | 
					tmp5 := tmp5 + 1.
					tmp6 := OrderedCollection new.
					arg3 do: [ :arg8 | tmp6 add: arg8 ].
					tmp6 add: tmp5.
					self
						calculate: arg7
						with: arg2
						at: tmp6
						andStoreIn: arg4 ] ]