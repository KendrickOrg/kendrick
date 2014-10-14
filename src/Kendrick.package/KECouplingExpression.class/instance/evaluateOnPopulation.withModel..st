acessing
evaluateOnPopulation: population withModel: aModel
	|tmpPopulation graphNode s|
	s := 0.
	tmpPopulation := population parent.
	graphNode := tmpPopulation graph nodes at: (population populationID).
	graphNode adjacentNodes do: [ :each|
		aModel currentSubPopulation: (tmpPopulation at: each).
		couplingParameter ifNotNil: [ aModel addTemporalParameter: couplingParameter value: (graphNode weight: couplingParameter of: each) ].
		s := s + (couplingExpression evaluateWithModel: aModel)
		].
	^ s