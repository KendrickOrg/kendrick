*Kendrick-InternalDSL-DSL
visitMessageNode: arg1
	| tmp1 tmp2 |
	tmp1 := #keyword.
	(Symbol findInternedSelector: arg1 selector asString)
		ifNil: [ tmp1 := (Symbol
				selectorThatStartsCaseSensitive: arg1 selector asString
				skipping: nil) isNil
				ifTrue: [ #keyword ]
				ifFalse: [ #keyword ] ].
	tmp2 := TextMethodLink selector: arg1 selector.
	self styleOpenParenthese: arg1.
	arg1 selectorParts
		with: arg1 keywordsPositions
		do: [ :arg2 :arg3 | 
			self
				addStyle: tmp1
				attribute: tmp2
				from: arg3
				to: arg3 + arg2 size - 1 ].
	(arg1 isCascaded not or: [ arg1 isFirstCascaded ])
		ifTrue: [ self visitNode: arg1 receiver ].
	arg1 arguments do: [ :arg4 | self visitNode: arg4 ].
	self styleCloseParenthese: arg1