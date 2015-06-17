as yet unclassified
timeSeriesAt: aCompartmentName
	| association |
	association := (STON fromString: aCompartmentName) associations first.
	^ self allTimeSeries select: [ :t | (t compartment at: association key) = association value ]