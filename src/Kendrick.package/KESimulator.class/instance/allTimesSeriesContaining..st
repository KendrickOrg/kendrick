accessing
allTimesSeriesContaining: aCompartmentName

"Return a collection of time series containing the compartment name"

"This is a bad design to expect to two differents types for the compartment name"
	| association |
	association := aCompartmentName.
	aCompartmentName isString ifTrue: [ association := (STON fromString: aCompartmentName) associations ].
	^ self timeSeries select: [ :t | t compartment associations includesAll: association ]