as yet unclassified
new: N type: type contact: n surface: surface population: p
	(type = 'random') | (type = 'Random') ifTrue: [ 
		^ (KERandomNetwork new) nbInd: N; contact: n; surface: surface; population: p
		 ].
	(type = 'spatial') | (type = 'Spatial') ifTrue: [ 
		^ (KESpatialNetwork new) nbInd: N; contact: n; surface: surface; population: p
		 ].
	(type = 'lattice') | (type = 'Lattice') ifTrue: [ 
		^ (KELatticeNetwork new) nbInd: N; contact: n; surface: surface; population: p
		 ].
	(type = 'smallworld') | (type = 'SmallWorld') ifTrue: [ 
		^ (KESmallWorldNetwork new) nbInd: N; contact: n; surface: surface; population: p
		 ]
	