as yet unclassified
testCompartments2
	|population|
	population := KEPopulation new attributes: '{#status: [#S,#I,#R], #region:[#A, #B, #C]}'.
	population relations: {#status. #region}.
	self assert: (population compartments size) equals: 9.
	self assert: (population compartments keys first keys) equals: #(#status #region) 