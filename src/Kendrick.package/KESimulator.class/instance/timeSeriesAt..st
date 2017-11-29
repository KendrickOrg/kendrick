accessing
timeSeriesAt: aCompartmentName

"Return a time series according to the compartment name"
"This is a bad design to expect to two differents types for the compartment name"

	| association |
	association := aCompartmentName.
	aCompartmentName isString ifTrue: [ association := (STON fromString: aCompartmentName) associations ].
	^ self timeSeries detect: [ :t | t compartment associations includesAll: association ]