as yet unclassified
testEvaluateForceOfInfectionFormula
	|population model|
	population := KEPopulation new.
	population attributes: '{#status: [#S, #I, #R]}'.
	
	model := KEModel new.
	model population: population.
	model addParameter: #beta value: 1.
	model buildFromAttributes: #(#status) 
			compartments: { 
			#(#S)->9999. 
			#(#I)->1.
			#(#R)->0
			}.
	
	self assert: (model population evaluateForceOfInfection: model formula: [ :m| (m atParameter: #beta) * (m probabilityOfContact: { #status->#I }) ]) equals: 1