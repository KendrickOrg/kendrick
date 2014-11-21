as yet unclassified
buildFromCompartments: aString
	|reader|
	(reader := STONReader on: aString readStream) allowComplexMapKeys: true.
	compartments := reader next
	