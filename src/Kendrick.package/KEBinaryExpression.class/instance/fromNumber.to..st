private
fromNumber: arg1 to: arg2
	| tmp2 |
	arg2 isArray
		ifTrue: [ tmp2 := 0.
			arg2
				do: [ :arg3 | 
					tmp2 := tmp2 + 1.
					arg3 isNumber
						ifTrue: [ arg2 at: tmp2 put: arg1 ].
					arg3 isArray
						ifTrue: [ self fromNumber: arg1 to: arg3 ] ] ]