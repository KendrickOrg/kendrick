accessing
individuals
	self isPopulation ifTrue: [ 
		individuals ifNil: [ 
			individuals := OrderedCollection new.
			subPopulations do: [ :comp|
				1 to: (comp nbOfIndividuals) do: [ :i| |ind|
					ind := KEIndividual new.
					ind currentStatus: (comp status).
					ind id: (individuals size + 1).
					individuals add: ind
				]
			]
		]
	].
	^ individuals