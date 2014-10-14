as yet unclassified
testEvaluateMovementEventRate
	|event model population|
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I).
		each at: #S put: 1000; at: #I put: 1
		 ].
	model := KEModel new.
	model population: population.
	event := KEMovementEvent new: #S from: model subPopulations first to: model subPopulations second rate: 0.01.
	
	self assert: (event evaluateAtPopulationLevelWithModel: model) equals: 10 
	