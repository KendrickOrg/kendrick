protected
tokenAsString: token

 token isArray ifTrue: [ 
		^ (token 
			inject: '( ' 
			into: [:subTotal :t | subTotal , ' ' ,  (self tokenAsString: t) ]) , ')'
	].

 ^ (#(- + * / , sum sqrt) includes: token)
				ifTrue: [ token asString ]
				ifFalse: [ 
						 '(self attributeOrParameter: ' ,  '#' , token asString , ')' 
				]			