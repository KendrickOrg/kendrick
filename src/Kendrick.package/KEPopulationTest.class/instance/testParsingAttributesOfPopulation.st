tests
testParsingAttributesOfPopulation
	|population|
	population := KEPopulation new.
	population attributes: '{#status: [#S, #I, #R], #country: [#Senegal, #Liberia]}'.
	
	self assert: population attributes isDictionary equals: true.
	self assert: population attributes keys size equals: 2 
