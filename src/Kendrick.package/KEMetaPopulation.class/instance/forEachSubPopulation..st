DSL Syntax
forEachSubPopulation: aBlock
	subPopulations do: [ :each| aBlock value: each ]