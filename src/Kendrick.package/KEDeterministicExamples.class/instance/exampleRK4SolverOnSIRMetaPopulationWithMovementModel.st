examples
exampleRK4SolverOnSIRMetaPopulationWithMovementModel
	"self new exampleRK4SolverOnSIRMetaPopulationWithMovementModel"
	|model simulator db graph1 graph2 output|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: '{#status: [#S,#I], #region:[#A,#B,#C,#D,#E]}'.
	model buildFromCompartments: {#region->#(A B C D E). #status->#(S I)} 
			cardinalities: #(1000 1 1000 0 1000 0 1000 0 1000 0).
	model addParameters: '{#mu: 0.001, #gamma: 0.1, #N: #sizeOfPopulation, #d: 0.0001}'.
	model addParameter: #beta inScopes: #region->#all values: 0.0001.
	
	graph1 := KEImmigrationGraph newOn: model population atAttribute: #region.
	graph1 edges: #all rate: #m values: 0.001.
	graph1 applyGraphTo: model.
	graph2 := KECouplingInfectionGraph newOn: model population atAttribute: #region.
	graph2 edges: #all rate: #beta values: 0.0.
	graph2 applyGraphTo: model.

	model addEquation:
		('S:t=mu*N-beta*S*I-d*S' parseAsAnEquation).
	model addEquation:
		('I:t=beta*S*I-gamma*I-d*I' parseAsAnEquation).
	simulator := KESimulator new: #RungeKutta from: 0 to: 2910 step: 1.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new.
	db data: (output dataAt: '{#status: #I}').
	db open
															
														