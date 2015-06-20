as yet unclassified
buildFromCompartments: aSTONString
	|reader|
	(reader := STONReader on: aSTONString readStream) allowComplexMapKeys: true.
	compartments := reader next.
	self population compartments: compartments
	
