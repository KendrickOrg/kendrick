examples
exampleIBMSimulatorOnSIRModelWithNetwork
	"self new exampleIBMSimulatorOnSIRModelWithNetwork"
	|model simulator network output db |
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 99,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	network := KENetwork on: model population atAttribute: #status.
	network := network build: #lattice numberOfContacts: 4.
	model population addGraph: network.
	network applyGraph: model.
	model addParameter: #beta value: 1.
	model addParameter: #gamma value: 0.1.
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new data: (output dataAt: '{#status: #I}').
	db open 