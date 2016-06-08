operators
splitStatus: anArrayOfSymbol by: attribute
   |key values|                                                                        	
	anArrayOfSymbol = #all ifTrue: [ ^ self splitStatus: (self atAttribute: #status) by: attribute ].
	anArrayOfSymbol ifNil: [ ^ self error: 'Concern does not contains status attribute' ].
	key := attribute key.
	values := attribute value.
	