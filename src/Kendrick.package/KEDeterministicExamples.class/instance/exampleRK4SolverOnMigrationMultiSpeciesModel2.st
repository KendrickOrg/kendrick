examples
exampleRK4SolverOnMigrationMultiSpeciesModel2
	"self new exampleRK4SolverOnMigrationMultiSpeciesModel2"
	|model simulator graph db output cards sgraph|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: {#region->((1 to: 15) asArray). #species->#(#bird #human). #status->#(S E I R)}.
	cards := OrderedCollection newFrom: #(49900 0 100 0 5000 0 0 0).
	cards addAll: ([|c| c := OrderedCollection new.
							1 to: 14 do: [:i| c addAll: #(50000 0 0 0 5000 0 0 0)]. c]) value.
	model buildFromCompartments: {#region->((1 to: 15) asArray). #species->#(#bird #human). #status->#(S E I R)} 
			cardinalities: cards.
	model addParameter: #beta value: 1.
	model addParameter: #d 
	      inScopes: {#species->#human. #species->#bird} 
	      values: #(0.0000365 0.00137). 
	model addParameter: #epsilon
	      inScopes: {#species->#human. #species->#bird} 
	      values: #(0.5 0.67).
	model addParameter: #gamma 
	      inScopes: {#species->#human. #species->#bird} 
	      values: #(0.25 0.233).  
	model addParameter: '{#v: 0.00274, #N: #sizeOfPopulation}'.
	model addParameter: #v value: 0.00274.
	model addParameter: #N value: #sizeOfPopulation.
	model configurations: { #sizeOfPopulation->#(#region #species). #rescale->false }.
	
	graph := KEMigrationNetwork 
					newOn: model population 
					atAttribute: #region 
					topology: (KERandomSmallWorldNetwork new K: 4; beta: 0).
	graph strengthOfAllConnections: {(#species->#bird)->0.1. (#species->#human)->0.03}.
	graph addMigrationTransitionsTo: model.
	
	sgraph := KEContactNetwork newOn: model population atAttribute: #species.
	sgraph edges: { #bird->#bird. #human->#bird }; strengthOfConnections: #(0.24 0.012).
	
	model addEquation: 'S:t=d*N-d*S-beta*S*I+v*R' parseAsAnEquation.
	model addEquation: 'E:t=beta*S*I-d*E-epsilon*E' parseAsAnEquation.
	model addEquation: 'I:t=epsilon*E-d*I-gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-d*R-v*R' parseAsAnEquation.
		
	simulator := KESimulator new: #RungeKutta from: 0 to: 800 step: 1.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new.
	db data: (output dataAt: '{#status: #I, #species: #human}').
	db open
															
														