A KEModel represents a mathematical model of epidemiology. It contains a population on which the disease is studied, a list of ODEs, a list of common parameters and a simulator.

Instance Variables
	compartmentSymbols:		<Dictionary>
	equations:		<OrderedCollection>
	parameters:		<Dictionary>
	population:		<KEPopulation>
	populationIDs:		<OrderedCollection>
	simulatorBuilder:		<KESimulatorBuilder>
	temporalParameters:		<Dictionary>

compartmentSymbols
	- a list of compartment name of the epidemiological model

equations
	- a list of odinary differential equations of mathematical model

parameters
	- a list of common parameters of model

population
	- a population on which the epidemic is investigated

populationIDs
	- each sub-population in population has an ID. This variable gets all the sub-population IDs

simulatorBuilder
	- a simulatorBuilder constructs the simulator to simulate this model

temporalParameters
	- Beside the fixed parameter, during runtime, model will have some parameters that will be changed depending on current context. The temporalParameters variable store all these values.
