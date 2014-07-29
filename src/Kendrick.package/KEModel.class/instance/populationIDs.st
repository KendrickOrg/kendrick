accessing
populationIDs
	populationIDs ifNil: [ populationIDs := population getPopulationIDs ].
	^ populationIDs