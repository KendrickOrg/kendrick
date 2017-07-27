operators
generateTensorSum: arg1
	| tmp1 tmp3 |
	tmp1 := OrderedCollection new.
	tmp3 := self generateKeys: arg1.
	(self transitions select: [ :arg2 | arg2 probability ~= 0 ])
		do: [ :arg3 | tmp1 addAll: (self generateTransitionsFrom: arg3 and: tmp3) ].
	tmp3 := self generateKeys: self transitions.
	(arg1 select: [ :arg4 | arg4 probability ~= 0 ])
		do: [ :arg5 | tmp1 addAll: (self generateTransitionsFrom: arg5 and: tmp3) ].
	^ tmp1