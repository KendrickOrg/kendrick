as yet unclassified
doesNotUnderstand: aMessage

	|variable value|

	"TODO: should also search in the concerns for setting comp/attri"
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
 
	(self model attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: variable.
			compartments at: variable put: value.
			self model atCompartment: variable value: value. 
		] ifFalse: [  
		(self model parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
				self model atParameter: variable value: value. "can be array here treat differently"
			] ifFalse: [ 
					(aMessage selector asString includes: $_)
						ifTrue: [ self addCompositeAtrributeOrParameter: variable value: value ]
						ifFalse: [  
							KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString
						] 
					]. 
		].