as yet unclassified
entitiesFor: arg1
	^ {(arg1
		collect: [ :arg2 | 
			| tmp2 |
			tmp2 := concerns copy.
			tmp2 add: model.
			tmp2 yourself
				select: [ :arg3 | arg3 attributes keys includes: arg2 ] ]) flatten.
	(arg1
		collect: [ :arg4 | 
			| tmp4 |
			tmp4 := concerns copy.
			tmp4 add: model.
			tmp4 yourself
				select: [ :arg5 | arg5 attributes values first includes: arg4 ] ])
		flatten}