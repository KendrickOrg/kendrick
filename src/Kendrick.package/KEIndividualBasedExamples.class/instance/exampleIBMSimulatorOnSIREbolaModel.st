examples
exampleIBMSimulatorOnSIREbolaModel
	"self new exampleIBMSimulatorOnSIREbolaModel"
	|model simulator output db g1 g2 |
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
	
	g1 := KEImmigrationGraph newOn: model population atAttribute: #country.
	g1 edges: #all rate: #m values: 0.05.
	g1 applyGraphTo: model.
	
	model addParameter: #beta inScopes: #country->#all values: 0.0002.
	g2 := KECouplingInfectionGraph newOn: model population atAttribute: #country.
	g2 edges: #all rate: #beta values: 0.0.
	g2 applyGraphTo: model.
	
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
	
	