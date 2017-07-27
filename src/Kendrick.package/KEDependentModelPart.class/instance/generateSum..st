as yet unclassified
generateSum: arg1
	| tmp1 |
	tmp1 := OrderedCollection new.
	arg1
		do: [ :arg2 | 
			| tmp2 |
			tmp2 := self transitions
				select: [ :arg3 | arg3 from = arg2 from & (arg3 to = arg2 to) ].
			tmp2 isEmpty
				ifTrue: [ tmp1 add: arg2 ] ].
	tmp1
		addAll: (self transitions select: [ :arg4 | arg4 probability ~= 0 ]).
	^ tmp1