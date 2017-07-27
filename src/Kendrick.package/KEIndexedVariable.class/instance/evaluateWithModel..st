as yet unclassified
evaluateWithModel: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp6 tmp7 tmp8 |
	tmp1 := indexList collect: [ :arg2 | arg2 evaluateWithModel: arg1 ].
	tmp1 := tmp1
		collect: [ :arg3 | 
			(self checkAllPositive: arg3)
				ifTrue: [ arg3 ]
				ifFalse: [ 0 ] ].
	tmp7 := arg1 atParameter: symbol.
	tmp7 isNumber
		ifTrue: [ ^ tmp7 ].
	tmp7
		ifNil: [ tmp8 := 0.
			tmp6 := '#'.
			tmp7 := self findKeysFromIndexedVariable: arg1 at: tmp1.
			tmp2 := arg1 population compartments.
			tmp3 := tmp2 keys.
			tmp3
				do: [ :arg4 | 
					tmp8 := 0.
					tmp6 := '#'.
					arg4 values
						do: [ :arg5 | 
							(tmp7 findString: '#' , arg5 asString , '#') >= 1
								ifTrue: [ tmp8 := tmp8 + 1.
									tmp6 := tmp6 , arg5 asString , '#' ] ].
					tmp8 = arg4 values size & (tmp6 size = tmp7 size)
						ifTrue: [ ^ arg1 atCompartment: arg4 ] ] ].
	(arg1 checkIndexedExpression: indexList)
		ifTrue: [ ^ tmp7 ].
	tmp1 do: [ :arg6 | tmp7 := tmp7 at: arg6 ].
	^ tmp7