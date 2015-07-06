accessing
sizeOfPopulation: source
	graphs first isCommutingNetwork 
	ifTrue: 
	[ ^ graphs first effectiveSizeOf: source population: self ].
	^ super sizeOfPopulation: source