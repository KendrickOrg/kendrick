accessing
indList
	"If population is a population of compartments (at the lowest level), initialize a list of individuals, if not, return nil"
	self isAPopulationOfCompartments ifTrue: [ 
		indList ifNil: [ 
			indList := OrderedCollection new.
			self nodes do: [ :comp|
				1 to: (comp getNbIndividuals) do: [ :i| |ind|
					ind := KEIndividual new.
					ind currentStatus: (comp status).
					ind pid: (self id).
					ind id: (indList size + 1).
					indList add: ind
					 ]
				 ]
			 ]
		 ].
	^ indList
	