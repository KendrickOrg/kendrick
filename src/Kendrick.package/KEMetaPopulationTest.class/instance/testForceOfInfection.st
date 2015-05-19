as yet unclassified
testForceOfInfection
	|population model g|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #species: [#m1, #m2, #m3]}'.
	g := KEContactNetwork newOn: population atAttribute: #species.
	g edges: { #m1->#m2. #m1->#m3 }; strengthOfAllConnections: 0.02.
	
	model := KEModel new.
	model population: population.
	model addParameter: #beta value: 1.
	model buildFromAttributes: #(#status #species) 
			compartments: { 
			#(#S #m1)->9999. 
			#(#S #m2)->1000. 
			#(#S #m3)->2000. 
			#(#I #m1)->1.
			#(#I #m2)->0.
			#(#I #m3)->0.
			#(#R #m1)->0.
			#(#R #m2)->0.
			#(#R #m3)->0 }.
	model forceOfInfection: #lambda 
			formula: [ :m| (m atParameter: #beta) * (m numberContacts: { #status->#I }) ].
	model parameters at: #inProcessingCompartment put: (Dictionary newFrom: {#status->#S. #species->#m2}).
	
	self assert: (model population forceOfInfection: model) equals: 0.02
	