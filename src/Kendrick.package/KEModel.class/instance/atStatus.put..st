accessing
atStatus: aSymbol put: aNumber
	|nb coms|
	(self atAttribute: #status) ifNil: [ ^ self error: 'The model does not contain the attribute #status' ].
	((self atAttribute: #status) includes: aSymbol) ifFalse: [ ^ self error: 'THe model does not contain the status', aSymbol asString ].
	self initCompartments ifNil: [ initCompartments := Dictionary newFrom: (self compartmentNames collect: [:c| c->0]) ].
	(population initialSize < (initCompartments values sum + aNumber)) ifTrue: [ ^ self error: 'Total size of compartments is greater than the population size' ].
	coms := (initCompartments keys select: [ :k| (k at: #status) = aSymbol ]).
	nb :=  coms size.
	((aNumber \\ nb) > 0) ifTrue: [  
		1 to: (aNumber \\ nb) do: [ :i| 
			initCompartments at: (coms at: i) put: ((aNumber // nb) + 1) ]
		].
	((aNumber \\ nb)+1) to: nb do: [ :i| initCompartments at: (coms at: i) put: (aNumber // nb) ].
	population compartments: initCompartments
	
	
	