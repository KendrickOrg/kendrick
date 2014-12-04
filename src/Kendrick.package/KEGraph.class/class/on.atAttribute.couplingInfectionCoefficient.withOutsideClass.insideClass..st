as yet unclassified
on: population atAttribute: attribute couplingInfectionCoefficient: beta withOutsideClass: arrayOfAssoc1 insideClass: arrayOfAssoc2
	|graph|
	graph := KECouplingInfectionGraph new population: population.
	graph nodes: ((population attributes at: attribute) collect: [:e| Dictionary newFrom: {(attribute->e)}]).
	graph edges: (arrayOfAssoc1->attribute) weight: beta 
			values: (arrayOfAssoc1 collect: [:e| e value]).
	graph loopEdges: (arrayOfAssoc2->attribute) weight: beta 
			values: (arrayOfAssoc2 collect: [:e| e value]).
	population addGraph: graph.
	^ graph
	