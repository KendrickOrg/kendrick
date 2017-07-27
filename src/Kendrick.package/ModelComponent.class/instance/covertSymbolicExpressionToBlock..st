protected
covertSymbolicExpressionToBlock: arg1
	| tmp1 |
	tmp1 := (arg1 collect: [ :arg2 | self tokenAsString: arg2 ])
		inject: ''
		into: [ :arg3 :arg4 | 
			(#(#sum #sqrt #size) includes: arg4)
				ifTrue: [ '(' , arg3 , ')' , arg4 ]
				ifFalse: [ arg3 , ' ' , arg4 ] ].
	^ Compiler new
		evaluate: '[:aModel |' , tmp1 , ']'
		in: thisContext sender
		to: thisContext sender receiver
		notifying: nil
		ifFail: [ ^ nil ]
		logged: false