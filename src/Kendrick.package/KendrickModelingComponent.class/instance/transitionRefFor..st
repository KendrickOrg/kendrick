protected
transitionRefFor: arg1
	| tmp1 |
	arg1 = 'Empty'
		ifTrue: [ ^ #empty ].
	tmp1 := (attributes associations
		select: [ :arg2 | arg2 value includes: arg1 ]) first.
	^ '{#' , tmp1 key asString , ': #' , arg1 , '}'