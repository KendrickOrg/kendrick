as yet unclassified
type: type numberOfContacts: n population: p
	(type = #random) | (type = #Random) ifTrue: [ 
		^ (KERandomNetwork new) numberOfContacts: n; population: p
		 ].
	(type = #spatial) | (type = #Spatial) ifTrue: [ 
		^ (KESpatialNetwork new) numberOfContacts: n; population: p
		 ].
	(type = #lattice) | (type = #Lattice) ifTrue: [ 
		^ (KELatticeNetwork new) numberOfContacts: n; population: p
		 ].
	(type = #smallworld) | (type = #SmallWorld) ifTrue: [ 
		^ (KESmallWorldNetwork new) numberOfContacts: n; population: p
		 ]
	