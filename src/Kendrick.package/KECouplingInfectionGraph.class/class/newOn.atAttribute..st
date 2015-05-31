as yet unclassified
newOn: population atAttribute: attribute
	|g|
	g := KECouplingInfectionGraph new population: population; attribute: attribute.
	g addNodes: (population atAttribute: attribute).
	population addGraph: g.
	^ g