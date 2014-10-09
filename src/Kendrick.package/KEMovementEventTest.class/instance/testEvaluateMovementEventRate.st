as yet unclassified
testEvaluateMovementEventRate
	|event model population|
	event := KEMovementEvent new: #S from: #(0 1) to: #(0 2) rate: 0.01.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I).
		each at: #S put: 1000; at: #I put: 1
		 ].
	model := KEModel new.
	model population: population.
	
	self assert: (event evaluateAtPopulationLevelWithModel: model) equals: 10 
	