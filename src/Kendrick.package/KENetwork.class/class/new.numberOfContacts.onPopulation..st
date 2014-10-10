as yet unclassified
new: type numberOfContacts: n onPopulation: p
	|network|
	
	(type = #random) | (type = #Random) ifTrue: [ 
		network := (KERandomNetwork new) numberOfContacts: n; population: p
		 ].
	(type = #spatial) | (type = #Spatial) ifTrue: [ 
		network := (KESpatialNetwork new) numberOfContacts: n; population: p
		 ].
	(type = #lattice) | (type = #Lattice) ifTrue: [ 
		network := (KELatticeNetwork new) numberOfContacts: n; population: p
		 ].
	(type = #smallworld) | (type = #SmallWorld) ifTrue: [ 
		network := (KESmallWorldNetwork new) numberOfContacts: n; population: p
		 ].
	"p getPopulationIDs do: [ :pid|
		(p at: pid) graph: (network initNetworkNodes: ((p at: pid) getNbIndividuals)).
		 ]."
	p graph: (network initNetworkNodes: p nbOfIndividuals).
	^ network
	