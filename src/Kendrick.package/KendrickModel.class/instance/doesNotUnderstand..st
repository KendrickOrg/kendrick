public-api
doesNotUnderstand: aMessage

	|variable value|
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
 
	(self attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: {variable->value}.
		] ifFalse: [  
		(parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
			] ifFalse: [ 
					KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString ]. 
		].
	
	