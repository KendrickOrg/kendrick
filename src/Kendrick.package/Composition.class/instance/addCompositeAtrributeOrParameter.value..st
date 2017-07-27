as yet unclassified
addCompositeAtrributeOrParameter: arg1 value: arg2
	| tmp1 |
	tmp1 := arg1 asString findTokens: '_'.
	(model attributeValuesIncludes: tmp1 first asSymbol)
		ifTrue: [ self addCompositeAttribute: tmp1 value: arg2 ]
		ifFalse: [ (model parameters keys includes: tmp1 first asSymbol)
				ifTrue: [ self addCompositeParameter: tmp1 value: arg2 ]
				ifFalse: [ KendrickDSLSyntaxError
						signal: 'Undefined Variable Being Set: ' , arg1 asString ] ]