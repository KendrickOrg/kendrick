protected
tokenAsString: arg1
	arg1 isArray
		ifTrue: [ ^ (arg1
				inject: '( '
				into: [ :arg2 :arg3 | arg2 , ' ' , (self tokenAsString: arg3) ])
				, ')' ].
	^ (#(#- #+ #* #/ #, #sum #sqrt) includes: arg1)
		ifTrue: [ arg1 asString ]
		ifFalse: [ '(self attributeOrParameter: ' , '#' , arg1 asString , ')' ]