examples
exampleRK4SolverOnMultipleRiskGroupsModel
	"self new exampleRK4SolverOnMultipleRiskGroupsModel"
	|model simulator graph db|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model attributes: {#riskGroup->(1 to: 5). #status->#(S I)}.
	model
		buildFromAttributes: #(#status #riskGroup)
		compartments: {
		  (#(#S 1) -> 6000). (#(#I 1) -> 0).
        (#(#S 2) -> 31000). (#(#I 2) -> 0). 
        (#(#S 3) -> 52000). (#(#I 3) -> 0). 
        (#(#S 4) -> 8000). (#(#I 4) -> 0). 
        (#(#S 5) -> 2999). (#(#I 5) -> 1). 
		}.
	model addParameter: #beta value: 16e-9.
	model addParameter: #gamma value: 0.2.
	
	graph := KEContactNetwork  
					newOn: model population 
					atAttribute: #riskGroup.
	graph edges: { 2->2. 2->3. 2->4. 2->5. 3->3. 3->4. 3->5. 4->4. 4->5. 5->5 };
			strengthOfConnections: #(9 30 180 300 100 600 1000 3600 6000 10000).

	model addEquation: 'S:t=gamma*I-beta*S*I' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
		
	simulator := KESimulator new: #RungeKutta from: 0 to: 30 step: 0.01.
	simulator executeOn: model.

	db := KEDiagramBuilder new.
	db data: (simulator timeSeriesAt: '{#status: #I}').
	db yLabel: 'Time (years)'.
	^ db view
															
														