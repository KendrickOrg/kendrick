examples
exampleRK4SolverOnMigrationMultiSpeciesModel
	"self new exampleRK4SolverOnMigrationMultiSpeciesModel"
	|model simulator graph db cards|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model addAttribute: #patch value: (1 to: 15).
	model addAttribute: #status value: #(S E I R).
	cards := OrderedCollection newFrom: #(900 0 100 0).
	14 timesRepeat: [ cards addAll: #(1000 0 0 0) ].
	model 
		buildFromCompartments: 
			{#patch->(1 to: 15). #status->#(S E I R)} 
		cardinalities: cards.
	model 
		addParameter: #beta 
		value: 
		[:aModel| |c val| 
			c := aModel currentCompartment at: #region.
			c = 1 ifTrue: [ val := 0.75 ] ifFalse: [ val := 0.5 ].
			val
		].
	model addParameters: {#v->0.00274. #d->0.0000365. #epsilon->0.5. #gamma->0.25}.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #patch.
		aModel sizeOfPopulation: c
		].
	"model configurations: { #sizeOfPopulation->#(#patch). #rescale->false }."
	
	graph := KEMigrationNetwork 
					newOn: model population 
					atAttribute: #patch topology: (KERandomSmallWorldNetwork new K: 2; beta: 0).
	graph strengthOfAllConnections: 0.03 "oneWay: true".
	graph addMigrationTransitionsTo: model.
	
	model addEquation: 'S:t=d*N-d*S-beta*S*I+v*R' parseAsAnEquation.
	model addEquation: 'E:t=beta*S*I-d*E-epsilon*E' parseAsAnEquation.
	model addEquation: 'I:t=epsilon*E-d*I-gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-d*R-v*R' parseAsAnEquation.
		
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
	simulator executeOn: model.

	db := KEDiagramBuilder new.
	db data: [|tmp| tmp := OrderedCollection new.
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:1}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:2}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:3}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:4}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:5}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:6}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:7}').
	tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:8}').
	tmp] value.
	db legends: { 'patch 1'. 'patch 2-15'. 'patch 3-14'. 'patch 4-13'. 'patch 5-12'. 'patch 6-11'. 'patch 7-10'. 'patch 8-9'}.
	db legendTitle: 'Infectious'.
	db xLabel: 'Time (days)'.
	^ db view
															
														