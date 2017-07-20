protected
covertSymbolicExpressionToBlock: anArray

			|body|

			body := (anArray collect: [ :token | 
				self tokenAsString: token
			]) inject: '' into: [ :expr :token | 
				(#(sum sqrt size) includes: token)
					ifFalse: [expr , ' ' , token]
					ifTrue: [ '(' , expr , ')' , token  ]
			].
			"the argument is superficial here since it is captured (backward compatibility)"
	
			^ Compiler new		evaluate: '[:aModel |' , body , ']'
					in: thisContext sender
					to: thisContext sender receiver
					notifying: nil
					ifFail: [^nil]
					logged: false.