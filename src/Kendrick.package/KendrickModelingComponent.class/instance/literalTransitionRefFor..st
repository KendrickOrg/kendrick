protected
literalTransitionRefFor: arg1
	| tmp1 |
	arg1 = 'Empty'
		ifTrue: [ ^ #empty ].
	tmp1 := (attributes associations
		select: [ :arg2 | arg2 value includes: arg1 ]) first.
	^ {(tmp1 key -> arg1)}