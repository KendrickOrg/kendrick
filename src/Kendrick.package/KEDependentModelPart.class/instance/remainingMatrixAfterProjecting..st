as yet unclassified
remainingMatrixAfterProjecting: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp2 := self attributes keys first.
	tmp1 := OrderedCollection new.
	tmp3 := arg1
		select: [ :arg2 | (arg2 from at: tmp2) = (arg2 to at: tmp2) ].
	tmp3 isEmpty
		ifTrue: [ tmp5 := arg1
				collect: [ :arg3 | 
					| tmp6 |
					tmp6 := KETransition
						from: arg3 from copy
						to: arg3 to copy
						probability: arg3 probability.
					tmp6 from removeKey: tmp2.
					tmp6 to removeKey: tmp2.
					tmp6 ].
			tmp4 := self generateKeys: tmp5.
			tmp4
				do: [ :arg4 | 
					tmp1
						addAll:
							(tmp4
								collect: [ :arg5 | KETransition from: arg4 to: arg5 probability: 0 ]) ].
			^ tmp1 ].
	tmp3 := tmp3
		collect: [ :arg6 | 
			| tmp7 |
			tmp7 := KETransition
				from: arg6 from copy
				to: arg6 to copy
				probability: arg6 probability.
			tmp7 from removeKey: tmp2.
			tmp7 to removeKey: tmp2.
			tmp7 ].
	tmp3
		do: [ :arg7 | 
			(tmp1 includes: arg7)
				ifFalse: [ tmp1 add: arg7 ] ].
	^ tmp1