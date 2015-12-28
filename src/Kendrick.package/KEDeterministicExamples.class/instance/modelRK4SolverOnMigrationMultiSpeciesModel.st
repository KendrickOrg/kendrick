examples
modelRK4SolverOnMigrationMultiSpeciesModel
	"self new exampleRK4SolverOnMigrationMultiSpeciesModel"
	| model graph |
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: {#region->((1 to: 15) asArray). #status->#(S E I R)}.
	model buildFromCompartments: {#region->((1 to: 15) asArray). #status->#(S E I R)} 
			cardinalities: ((OrderedCollection newFrom: #(900 100 0 0)) 
									addAll: ([|c| c := OrderedCollection new.
													1 to: 14 do: [:i| c addAll: #(1000 0 0 0)]. c]) value).
	model 
		addParameter: #beta 
		value: 
		[:aModel| |c| 
			c := aModel currentCompartment at: #region.
			c = 1 ifTrue: [ ^ 0.75 ] ifFalse: [ ^ 0.5 ]
		].
	model addParameters: {#d->0.0000365. #epsilon->0.5. #gamma->0.25. #N->#sizeOfPopulation}.
	model configurations: { #sizeOfPopulation->#(#region). #rescale->false }.
	
	graph := KEMigrationNetwork 
					newOn: model population 
					atAttribute: #region 
					topology: (KERandomSmallWorldNetwork new K: 4; beta: 0).
	graph strengthOfAllConnections: 0.03.
	
	model addEquation: 'S:t=d*N-d*S-beta*S*I' parseAsAnEquation.
	model addEquation: 'E:t=beta*S*I-d*E-epsilon*E' parseAsAnEquation.
	model addEquation: 'I:t=epsilon*E-d*I-gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-d*R' parseAsAnEquation.
	
	^ model
	
	 
	
	