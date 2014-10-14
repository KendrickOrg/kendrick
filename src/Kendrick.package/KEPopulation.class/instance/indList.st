accessing
indList
	self isPopulation ifTrue: [ 
		indList ifNil: [ 
			indList := OrderedCollection new.
			compartments do: [ :comp|
				1 to: (comp nbOfIndividuals) do: [ :i| |ind|
					ind := KEIndividual new.
					ind currentStatus: (comp status).
					"ind populationID: (self populationID)."
					ind id: (indList size + 1).
					indList add: ind
				]
			]
		]
	].
	^ indList
	