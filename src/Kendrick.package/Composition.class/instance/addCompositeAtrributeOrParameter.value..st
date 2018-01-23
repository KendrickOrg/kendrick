as yet unclassified
addCompositeAtrributeOrParameter: variable value: value

	|variablePlusAttributes|
	
	variablePlusAttributes := variable asString findTokens: '_'.
	"assume single attribute for the time being"
	
	(self model attributeValuesIncludes: variablePlusAttributes first asSymbol)
		ifTrue: [ 
			self addCompositeAttribute: variablePlusAttributes value: value. 
		] ifFalse: [  
		(self model parameters keys includes: variablePlusAttributes first asSymbol)
			ifTrue: [  
				self addCompositeParameter: variablePlusAttributes value: value.
			] ifFalse: [ 
					KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString ]. 
		].
	