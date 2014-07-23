as yet unclassified
type: type numberOfContacts: n surface: surface population: p
	(type = #random) | (type = #Random) ifTrue: [ 
		^ (KERandomNetwork new) numberOfContacts: n; surface: surface; population: p
		 ].
	(type = #spatial) | (type = #Spatial) ifTrue: [ 
		^ (KESpatialNetwork new) numberOfContacts: n; surface: surface; population: p
		 ].
	(type = #lattice) | (type = #Lattice) ifTrue: [ 
		^ (KELatticeNetwork new) numberOfContacts: n; surface: surface; population: p
		 ].
	(type = #smallworld) | (type = #SmallWorld) ifTrue: [ 
		^ (KESmallWorldNetwork new) numberOfContacts: n; surface: surface; population: p
		 ]
	