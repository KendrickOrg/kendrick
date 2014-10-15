A KEPopulation is a population splitted in several compartments  (see class KECompartment for more details) in which the disease is spreading.

Instance Variables
	compartmentNames:		<OrderedCollection>
	compartments:		<OrderedCollection>
	individuals:		<OrderedCollection>
	parent:		<KEPopulation>
	populationID:		<OrderedCollection>
	rates:		<OrderedCollection>
	events:   	         <OrderedCollection>

compartmentNames
	- A collection of compartment names of the epidemiological model

compartments
	- A collection of compartments in the population

individuals
	- A collection of individuals (instances of KEIndividual class)

parent
	- Each compartment in system is belong to one population, so it is necessaire to know its parent (the population that contains it). By initialisation, the parent of the population is itself.

populationID
	- Each population has an identification to distinguer each other in the case of multi-populations. The populationID is an Array of which each element is the ID of its parents and itself. The root population has an ID equal to 0. Each its subpopulation has ID 1, 2, ...

rates
	- For improving the speed of simulator, we store the event rates of each population in the variable rates so that the simulator would easily access to.
	
events
         - Each population will have a list of events that show epidemiological processes could happen over this population. The events list are generated once time, before the simulation starts.
