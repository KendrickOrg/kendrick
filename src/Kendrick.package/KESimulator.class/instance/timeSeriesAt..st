as yet unclassified
timeSeriesAt: aCompartmentName
	| association key|
	association := aCompartmentName.
	aCompartmentName isString ifTrue: [ association := (STON fromString: aCompartmentName) associations ].
	^ self allTimeSeries select: [ :t | t compartment associations includesAll: association ]