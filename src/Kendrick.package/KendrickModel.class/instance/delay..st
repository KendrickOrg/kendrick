public-api
delay: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	tmp1 := arg1 select: [ :arg2 | (#(#-- #--> #,) includes: arg2) not ].
	delays add: tmp1.
	tmp2 := tmp1 first.
	tmp3 := self literalTransitionRefFor: tmp1 second.
	tmp4 := tmp1 third.
	tmp5 := self literalTransitionRefFor: tmp1 fourth.
	tmp6 := {(tmp5 first key -> tmp1 fifth)}.
	backEndEntity atAttribute: tmp5 first key add: tmp1 fifth.
	(attributes at: tmp5 first key) add: tmp1 fifth.
	backEndEntity
		removeTransitionFrom: tmp3 to: tmp5;
		addTransitionFrom: tmp3
			to: tmp6
			probability: [ :arg3 | arg3 atParameter: tmp4 ];
		addTransitionFrom: tmp6
			to: tmp5
			probability: [ :arg4 | arg4 atParameter: tmp2 ];
		addTransitionFrom: tmp6
			to: #empty
			probability: [ :arg5 | 
			| tmp8 |
			tmp8 := emptyRate.
			arg5 atParameter: (tmp8 ifNil: [ #mu ] ifNotNil: [ tmp8 ]) ]