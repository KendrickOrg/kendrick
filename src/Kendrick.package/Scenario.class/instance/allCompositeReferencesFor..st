as yet unclassified
allCompositeReferencesFor: arg1
	| tmp1 tmp2 tmp3 tmp5 |
	tmp2 := arg1 first.
	tmp1 := arg1 allButFirst
		collect: [ :arg2 | 
			| tmp7 |
			tmp7 := concerns copy.
			tmp7 add: model.
			(tmp7 yourself
				select: [ :arg3 | arg3 attributes keys includes: arg2 ]) first
				attributes associationAt: arg2 ].
	tmp5 := {{(self referencesFor: tmp2)} asOrderedCollection}
		asOrderedCollection.
	tmp1
		do: [ :arg4 | 
			| tmp8 |
			tmp8 := OrderedCollection new.
			tmp5
				do: [ :arg5 | 
					arg4 value
						do: [ :arg6 | 
							| tmp10 |
							tmp10 := arg5 copy.
							tmp10 add: arg4 key -> arg6.
							tmp8 add: tmp10 yourself ] ].
			tmp5 := tmp8 ].
	^ tmp5 collect: [ :arg7 | arg7 asArray ]