as yet unclassified
appendNode: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp6 |
	tmp1 := arg1 key.
	tmp2 := arg1 value.
	tmp3 := Random new.
	tmp4 := (activeNodes
		collect: [ :arg2 | (tmp2 atNode: arg2) adjacentNodes size ]) sum.
	tmp6 := 0.
	[ tmp6 <= m0 ]
		whileTrue: [ activeNodes
				do: [ :arg3 | 
					| tmp7 tmp8 |
					tmp8 := (tmp2 atNode: arg3) adjacentNodes size.
					tmp7 := tmp8 / tmp4.
					tmp7 > tmp3 next
						ifTrue: [ tmp2 edgesFrom: tmp1 toAll: (Array with: arg3).
							tmp6 := tmp6 + 1 ] ] ].
	activeNodes add: tmp1