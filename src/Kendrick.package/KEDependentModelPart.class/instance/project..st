accessing
project: arg1
	| tmp1 tmp2 tmp3 |
	tmp2 := self attributes keys first.
	tmp1 := OrderedCollection new.
	tmp3 := arg1
		select: [ :arg2 | (arg2 from at: tmp2) ~= (arg2 to at: tmp2) ].
	tmp3 isEmpty
		ifTrue: [ ^ self
				error: 'The model have not contained the concern on which depends this concern.' ].
	(tmp3
		collect: [ :arg3 | 
			KETransition
				from: (Array with: (arg3 from associationAt: tmp2))
				to: (Array with: (arg3 to associationAt: tmp2))
				probability: arg3 probability ])
		do: [ :arg4 | 
			(tmp1 includes: arg4)
				ifFalse: [ tmp1 add: arg4 ] ].
	^ tmp1