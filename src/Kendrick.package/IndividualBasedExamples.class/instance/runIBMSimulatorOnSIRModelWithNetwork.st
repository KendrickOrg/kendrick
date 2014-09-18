tests
runIBMSimulatorOnSIRModelWithNetwork
	"self new runIBMSimulatorOnSIRModelWithNetwork"
	|model|
	"if run the model 4 with all individuals connected together in network, the parameter beta must be set to 0.01 (beta*1/N)"
	"model := self createSIRSimpleModel4: #smallworld."
	model := self createSIRSimpleModel4: #lattice.
	"model := self createSIRSimpleModel4: #spatial."
	"model := self createSIRSimpleModel4: #random."
	model simulator addAdapter: (KENetworkAdapter new).
	model run: #IBMDiscreteTime from: 0.0 to: 200 step: 0.1.
	model plot: #I.
	"(model simulator data at: #I) save: 'I_2.dat'."
	
	