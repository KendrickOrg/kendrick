public-api
doesNotUnderstand: aMessage

	|variable value|
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
 
	(self attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: variable.
			self atCompartment: variable value: value. 
		] ifFalse: [  
		(parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
				self addParameter: variable value: value. "can be array here treat differently"
			] ifFalse: [ 
					KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString ]. 
		].
	
	