as yet unclassified
atParameter: aSymbol
	|p|
	aSymbol = #t ifTrue: [ ^ self t ].
	"aSymbol = #inProcessingCompartment ifTrue: [ ^ parameters at: #inProcessingCompartment ifAbsent: [#population] ]."
	(forceOfInfections includes: aSymbol) ifTrue: [ ^ self evaluateForceOfInfection: aSymbol ].
	
	"p := self atParameter: aSymbol atScope: (self atParameter: #inProcessingCompartment).
	p ifNil: [ p := self atParameter: aSymbol atScope: #population ]." 
	"p = #sizeOfPopulation ifTrue: [ ^ self population sizeOf: (self atParameter: #inProcessingCompartment) population: (configurations at: #sizeOfPopulation) ]."
	p := (self parameters at: aSymbol ifAbsent: [ nil ]).
	p ifNotNil: [ ^ p value: self ].
	^ nil
	