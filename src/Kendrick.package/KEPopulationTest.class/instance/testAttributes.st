as yet unclassified
testAttributes
	|population|
	population := KEPopulation new.
	population attributes: { 
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2) }.
	
	self assert: (population attributes at: #status) size equals: 3.
	self assert: (population attributes at: #species) size equals: 3