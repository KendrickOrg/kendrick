public-api
allTransitionsFor: arg1
	| tmp1 tmp2 tmp3 |
	tmp1 := arg1 first.
	tmp3 := arg1 second.
	tmp2 := arg1 last.
	({tmp1.
	tmp2} includes: #Empty)
		ifTrue: [ emptyRate := tmp3 ].
	(self isAttribute: tmp1)
		ifTrue: [ (self allTransitionRefsForAttribute: tmp1)
				do: [ :arg2 | 
					backEndEntity
						addTransitionFrom: arg2
						to: (self transitionRefFor: tmp2)
						probability: [ :arg3 | arg3 atParameter: tmp3 ] ] ]
		ifFalse: [ (self isAttribute: tmp2)
				ifTrue: [ (self allTransitionRefsForAttribute: tmp1)
						do: [ :arg4 | 
							backEndEntity
								addTransitionFrom: (self transitionRefFor: tmp1)
								to: arg4
								probability: [ :arg5 | arg5 atParameter: tmp3 ] ] ]
				ifFalse: [ backEndEntity
						addTransitionFrom: (self transitionRefFor: tmp1)
						to: (self transitionRefFor: tmp2)
						probability: [ :arg6 | arg6 atParameter: tmp3 ] ] ]