acessing
evaluateOnPopulation: population withModel: aModel
	|tmpID tmpPopulation graphNode s|
	s := 0.
	tmpID := population populationID asArray.
	tmpPopulation := population parent.
	graphNode := tmpPopulation graph nodes at: (tmpID last).
	graphNode adjacentNodes do: [ :each|
		aModel currentPopulationID: (tmpPopulation at: each) populationID asArray.
		couplingParameter ifNotNil: [ aModel addTemporalParameter: couplingParameter value: (graphNode weight: couplingParameter of: each) ].
		s := s + (couplingExpression evaluateWithModel: aModel)
		].
	^ s