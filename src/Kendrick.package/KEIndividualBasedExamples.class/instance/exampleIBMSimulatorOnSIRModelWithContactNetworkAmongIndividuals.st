examples
exampleIBMSimulatorOnSIRModelWithContactNetworkAmongIndividuals
	"self new exampleIBMSimulatorOnSIRModelWithContactNetworkAmongIndividuals"
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
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	"change the value of p to 1 and beta to 0.01 to test the case of mixed population that means an individual has contacts with all others"
	network := KEContactNetwork 
						newOn: model population 
						atAttribute: #status 
						topology: (KERandomNetwork new p: 0.4).
	network strengthOfAllConnections: 1.

	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 0.1.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new data: (output dataAt: '{#status: #I}').
	db open 