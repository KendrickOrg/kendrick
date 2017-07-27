protected
allTransitionRefsForAttributeWith: arg1
	| tmp1 |
	arg1 asString translateToLowercase = 'empty'
		ifTrue: [ ^ {#empty} ].
	tmp1 := attributes associations
		select: [ :arg2 | arg2 value includes: arg1 ].
	^ tmp1 value
		collect: [ :arg3 | '{#' , tmp1 key asString , ': #' , arg3 , '}' ]