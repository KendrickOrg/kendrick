as yet unclassified
random: arg1 select: arg2
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := arg2 sum.
	tmp2 := 0.
	tmp3 := arg2 size.
	tmp4 := tmp3.
	1 to: tmp4 do: [ :tmp5 | 
		tmp2 := tmp2 + (arg2 at: tmp5).
		tmp2 >= (tmp1 * arg1)
			ifTrue: [ ^ tmp5 ] ].
	^ 0