examples
runIBMSimulatorOnSIRModelWithNetwork
	"self new runIBMSimulatorOnSIRModelWithNetwork"
	|model simulator|
	"if run the model 4 with all individuals connected together in network, the parameter beta must be set to 0.01 (beta*1/N)"
	"model := self createSIRSimpleModel4: #smallworld."
	"model := self createSIRSimpleModel4: #lattice."
	"model := self createSIRSimpleModel4: #spatial."
	model := self createSIRSimpleModel4: #smallworld.
	simulator := KESimulatorBuilder new.
	simulator addAdapter: (KENetworkAdapter new).
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 200 step: 0.1 model: model.
	simulator plot: #I.
	"(model simulator data at: #I) save: 'I_2.dat'."
	
	