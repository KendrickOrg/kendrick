as yet unclassified
timeSeriesAt: aCompartmentName
	| association |
	association := (STON fromString: aCompartmentName) associations.
	^ self allTimeSeries select: [ :t | t compartment associations includesAll: association ]