accessing
isAPopulationOfCompartments
	"Check if the population is not structured as meta-population, the sub-populations composes of compartments"
	^ (subPopulations at: 1) isACompartment
	