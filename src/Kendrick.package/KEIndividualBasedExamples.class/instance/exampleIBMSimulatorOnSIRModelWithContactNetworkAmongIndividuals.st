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
	
	"KERandomNetwork, p = 1 ==> Mixing population, compare with model with no network (exampleIBMSimulatorOnSIRModel 2)"
	"KERandomSmallworldNetwork ==> beta = 0: regular ring lattice; beta = 1: random network"
	network := KEContactNetwork 
						newOn: model population 
						atAttribute: #status 
						topology: (KERandomSmallWorldNetwork new K: 4; beta: 1).
	network strengthOfAllConnections: 1.

	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 0.1.
	simulator executeOn: model.
	output := simulator data.
	db := KEDiagramBuilder new data: (output dataAt: '{#status: #I}').
	db open 