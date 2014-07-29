DSL Syntax
numberOfSubPopulations: aNumber
	1 to: aNumber do: [ :i|
		|node|
		node := KEMetaPopulation new.
		self addSubPopulation: node
		 ]