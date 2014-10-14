as yet unclassified
atParameter: aSymbol
	|x pop|
	pop := self currentSubPopulation.
	pop ifNotNil: [
		x := pop atParameter: aSymbol
		].
	x ifNil: [ 
		x := parameters at: aSymbol ifAbsent: [^ nil].
		x ifNil: [ ^ nil ].
		x expression 
		ifNotNil: [ 
			x evaluateWithModel: self
		 	]
		 ].
	^ x value