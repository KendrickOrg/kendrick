DSL functions
buildNetworkType: type numberOfContacts: nbCont
	type = #random ifTrue: [ ^ (KERandomNetwork new nodes: self nodes; numberOfContacts: nbCont; population: self population; networkOfIndividuals: self networkOfIndividuals) initNetwork ].
	type = #spatial ifTrue: [ ^ (KESpatialNetwork new nodes: self nodes; numberOfContacts: nbCont; population: self population; networkOfIndividuals: self networkOfIndividuals) initNetwork ].
	type = #lattice ifTrue: [ ^ (KELatticeNetwork new nodes: self nodes; numberOfContacts: nbCont; population: self population; networkOfIndividuals: self networkOfIndividuals) initNetwork ].
	type = #smallworld ifTrue: [ ^ (KESmallWorldNetwork new nodes: self nodes; numberOfContacts: nbCont; population: self population; networkOfIndividuals: self networkOfIndividuals) initNetwork ]