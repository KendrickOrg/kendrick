accessing
to: aCompartment
	|reader|
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	to := reader next