as yet unclassified
testRelations
	|population|
	"By default, relations = attributes keys: a set of equality expression on name of attributes"
	population := KEPopulation new attributes: '{#status: [#S, #I, #R]}'.
	self assert: population relations equals: { #status } 