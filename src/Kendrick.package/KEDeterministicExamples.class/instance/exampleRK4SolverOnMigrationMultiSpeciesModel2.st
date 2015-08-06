examples
exampleRK4SolverOnMigrationMultiSpeciesModel2
	"self new exampleRK4SolverOnMigrationMultiSpeciesModel2"
	|model simulator graph db cards sgraph f|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: {#patch->(1 to: 15). #species->#(#bird #human). #status->#(S E I R)}.
	cards := OrderedCollection newFrom: #(4990 0 10 0 500 0 0 0).
	14 timesRepeat: [cards addAll: #(5000 0 0 0 500 0 0 0) ].
	model buildFromCompartments: 
				{#patch->(1 to: 15). 
				#species->#(#bird #human). #status->#(S E I R)} 
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
	model addParameter: #v value: 0.00274.
	model addParameter: #N value: #sizeOfPopulation.
	model configurations: { #sizeOfPopulation->#(#patch #species). #rescale->false }.
	
	graph := KEMigrationNetwork 
					newOn: model population 
					atAttribute: #patch 
					topology: (KERandomSmallWorldNetwork new K: 2; beta: 0).
	graph 
		strengthOfAllConnections: 
			{(#species->#bird)->0.1. 
			(#species->#human)->0.03} 
		oneWay: true.
	graph addMigrationTransitionsTo: model.
	
	sgraph := KEContactNetwork newOn: model population atAttribute: #species.
	sgraph 
		edges: {#bird->#bird. #human->#bird}; 
		strengthOfConnections: #(0.42 0.21) oneWay: true.
	
	model addEquation: 'S:t=d*N-d*S-beta*S*I+v*R' parseAsAnEquation.
	model addEquation: 'E:t=beta*S*I-d*E-epsilon*E' parseAsAnEquation.
	model addEquation: 'I:t=epsilon*E-d*I-gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-d*R-v*R' parseAsAnEquation.
		
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
	simulator executeOn: model.
	db := KEDiagramBuilder new.
	"db data: {([|d tmp|
		tmp := (simulator timeSeriesAt: '{#status: #I, #species: #human}') collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: '{#status: #I, #species: #human}')
		] value)}.
	db data: (simulator timeSeriesAt: '{#status: #I, #species: #human, #patch: 1}')."
	f := [:name| |d tmp|
		tmp := (simulator timeSeriesAt: name) collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) 
		].
	db data: { (f value: '{#status:#I,#species:#bird}'). (f value: '{#status: #I, #species: #human}') }.
	db xLabel: 'Time (days)'.
	db legendTitle: 'Total of infectious'.
	db legends: { 'birds'. 'humans' }.
	^ db view
															
														