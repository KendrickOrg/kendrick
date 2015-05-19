examples
exampleGillespieDirectOnSIRMigrationModel
	"self new exampleGillespieDirectOnSIRMigrationModel"
	|model simulator db graph output|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: '{#status: [#S,#I], #region:[#A,#B,#C,#D,#E]}'.
	model buildFromCompartments: {#region->#(A B C D E). #status->#(S I)} 
			cardinalities: #(1000 1 1000 0 1000 0 1000 0 1000 0).
	model addParameters: '{#mu: 0.001, #gamma: 0.1, #N: #sizeOfPopulation, #d: 0.0001}'.
	model addParameter: #beta value: 0.0001.
	
	graph := KEMigrationNetwork newOn: model population atAttribute: #region.
	graph edges: #all; strengthOfAllConnections: 0.001.
	graph addMigrationTransitionsTo: model.

	model addEquation:
		('S:t=mu*N-beta*S*I-d*S' parseAsAnEquation).
	model addEquation:
		('I:t=beta*S*I-gamma*I-d*I' parseAsAnEquation).
		
	simulator := KESimulator new: #Gillespie from: 0 to: 2910 step: 1.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new.
	db data: (output dataAt: '{#status: #I}').
	db open
															
														