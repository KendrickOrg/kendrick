public-api
imports: arg1 using: arg2
	| tmp1 tmp2 tmp3 tmp5 tmp7 |
	tmp1 := self attributes associations first key.
	tmp2 := self attributes associations first value.
	tmp2 size ~= arg1 size
		ifTrue: [ ^ self error: 'Size of input is not compatible' ].
	tmp3 := arg1 size.
	1 to: tmp3 do: [ :tmp4 | 
		tmp5 := (arg1 at: tmp4) size.
		1 to: tmp5 do: [ :tmp6 | 
			((arg1 at: tmp4) at: tmp6) ~= 0
				ifTrue: [ tmp7 := ((arg1 at: tmp4) at: tmp6) = 0
						ifTrue: [ 0 asString ]
						ifFalse: [ tmp7 := arg2 asString ].
					backEndEntity
						addTransitionFrom: {(tmp1 -> (tmp2 at: tmp4))}
						to: {(tmp1 -> (tmp2 at: tmp6))}
						probability: tmp7 asString ] ] ]