as yet unclassified
buildFromCompartments: aSTONString
	|reader|
	(reader := STONReader on: aSTONString readStream) allowComplexMapKeys: true.
	initCompartments := reader next.
	self population compartments: initCompartments
	
