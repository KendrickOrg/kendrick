accessing
populationIDs
	populationIDs ifNil: [ populationIDs := population getPIDList ].
	^ populationIDs