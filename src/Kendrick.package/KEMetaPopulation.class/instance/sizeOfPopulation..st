accessing
sizeOfPopulation: source
	| config |
	graphs first isCommutingNetwork 
	ifTrue: 
	[	config := configurations at: #sizeOfPopulation. 
		^ graphs first effectiveSizeOf: source population: config
		].
	^ super sizeOfPopulation: source