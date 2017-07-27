general
generateTransitionsFrom: arg1 and: arg2
	| tmp1 |
	tmp1 := OrderedCollection new.
	arg2 isEmpty
		ifTrue: [ tmp1 add: arg1 ]
		ifFalse: [ (arg2 reject: [ :arg3 | arg3 values includes: #empty ])
				do: [ :arg4 | 
					| tmp2 tmp3 tmp4 |
					tmp2 := arg4 copy.
					arg1 from
						keysAndValuesDo: [ :arg5 :arg6 | tmp2 at: arg5 put: arg6 ].
					tmp3 := tmp2 copy.
					arg1 to
						keysAndValuesDo: [ :arg7 :arg8 | tmp2 at: arg7 put: arg8 ].
					tmp4 := tmp2 copy.
					tmp1
						add: (KETransition from: tmp3 to: tmp4 probability: arg1 probability) ] ].
	^ tmp1