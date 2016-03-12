accessing
addIndividual: ind
	|g|
	super addIndividual: ind.
	g := graphs select: [ :e| e attribute = #status ].
	g isNotEmpty ifTrue: [ g first createNodeOf: ind ]

	