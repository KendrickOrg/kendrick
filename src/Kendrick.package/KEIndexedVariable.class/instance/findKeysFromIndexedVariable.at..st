as yet unclassified
findKeysFromIndexedVariable: arg1 at: arg2
	| tmp1 tmp2 tmp3 tmp5 tmp6 tmp7 tmp8 |
	tmp1 := arg1 attributes.
	tmp7 := '#' , symbol , '#'.
	tmp5 := false.
	tmp2 := tmp1 at: #status.
	tmp2
		do: [ :arg3 | 
			tmp5
				ifFalse: [ arg3 = symbol
						ifTrue: [ tmp5 := true ] ] ].
	tmp5
		ifTrue: [ tmp3 := tmp1 at: #species.
			tmp8 := 1.
			tmp3
				do: [ :arg4 | 
					tmp8 = (arg2 at: 1)
						ifTrue: [ tmp7 := tmp7 , arg4 , '#' ].
					tmp8 := tmp8 + 1 ].
			arg2 size = 2
				ifTrue: [ tmp1 keys
						do: [ :arg5 | 
							arg5 = #status | (arg5 = #species)
								ifFalse: [ tmp6 := tmp1 at: arg5.
									tmp8 := 1.
									tmp6
										do: [ :arg6 | 
											tmp8 = (arg2 at: 2)
												ifTrue: [ tmp7 := tmp7 , arg6 asString , '#' ].
											tmp8 := tmp8 + 1 ] ] ] ] ].
	^ tmp7