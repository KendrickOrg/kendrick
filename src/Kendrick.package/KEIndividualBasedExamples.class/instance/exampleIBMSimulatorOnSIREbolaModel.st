examples
exampleIBMSimulatorOnSIREbolaModel
	"self new exampleIBMSimulatorOnSIREbolaModel"
	|model simulator output db g1  |
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: '{
		#status: [ #S, #I, #R ],
		#country: [ #Liberia, #Guinea, #SierraLeone, #Nigeria, #Senegal, #Niger ]
	}'.	
	model buildFromCompartments: '{
		{ #status: #S, #country: #Liberia }: 950,
		{ #status: #I, #country: #Liberia }: 50,
		{ #status: #R, #country: #Liberia }: 0,
		{ #status: #S, #country: #Guinea }: 1000,
		{ #status: #I, #country: #Guinea }: 0,
		{ #status: #R, #country: #Guinea }: 0,
		{ #status: #S, #country: #SierraLeone }: 1000,
		{ #status: #I, #country: #SierraLeone }: 0,
		{ #status: #R, #country: #SierraLeone }: 0,
		{ #status: #S, #country: #Nigeria }: 1000,
		{ #status: #I, #country: #Nigeria }: 0,
		{ #status: #R, #country: #Nigeria }: 0,
		{ #status: #S, #country: #Senegal }: 1000,
		{ #status: #I, #country: #Senegal }: 0,
		{ #status: #R, #country: #Senegal }: 0,
		{ #status: #S, #country: #Niger }: 1000,
		{ #status: #I, #country: #Niger }: 0,
		{ #status: #R, #country: #Niger }: 0
	}'.
	model addParameter: #gamma value: 0.1.
	model addParameter: #beta value: 0.0002.
	
	g1 := KEMigrationNetwork newOn: model population atAttribute: #country.
	g1 edges: #all; strengthOfAllConnections: 0.05.
	g1 addMigrationTransitionsTo: model.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	simulator := KESimulator new: #IBM from: 0.0 to: 100 step: 0.1.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #	I}').
	db open.
	db openMap: #africa 
	   countries: (model population atAttribute: #country) 
	   coloredBy: #peakOfEpidemic
	
	