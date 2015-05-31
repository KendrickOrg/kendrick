examples
exampleIBMSimulatorOnSIRModelWithNetworkWithTransitionByProbability
	"self new exampleIBMSimulatorOnSIRModelWithNetworkWithTransitionByProbability"
	|model simulator network output db |
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 99,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: #beta value: 1.
	model addParameter: #gamma value: 0.1.
	model addTransitionFrom: '{#status:#S}'
		to: '{#status: #I}'
		probability: [:m| |g|
			g := (m population graphs select: [ :e| e networkOfIndividuals ]) first.
			(m atParameter: #beta) * ((g nodes at: (m atParameter: #individual) id) atContact: #I) 
			].
	model addTransitionFrom: '{#status:#I}'
		to: '{#status: #R}'
		probability: [:m| m atParameter: #gamma].
	network := KENetwork on: model population atAttribute: #status networkType: #spatial numberOfContacts: 4.
	network applyGraphTo: model.
	
	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 0.1.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new data: (output dataAt: '{#status: #I}').
	db open 