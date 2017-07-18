accessing
timeSeriesAt: aCompartmentName
	| association |
	association := aCompartmentName.
	aCompartmentName isString ifTrue: [ association := (STON fromString: aCompartmentName) associations ].
	^ self timeSeriesOutputs select: [ :t | t compartment associations includesAll: association ]