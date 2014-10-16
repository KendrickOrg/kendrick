accessing
compartments: aCollection
	compartmentNames addAll: aCollection.
	aCollection do: [ :each|
		|aCompartment|
		aCompartment := KECompartment status: each initialNumberOfIndividuals: 0.
		compartments add: aCompartment
		 ]
 
	