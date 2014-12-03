as yet unclassified
testCompartments
	|population|
	population := KEPopulation new attributes: '{#status: [#S,#I,#R], #region:[#A, #B, #C]}'.
	population relations: {#status}.
	self assert: (population compartments size) equals: 3.
	self assert: (population compartments keys first keys) equals: #(#status) 