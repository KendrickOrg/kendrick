as yet unclassified
atParameter: aSymbol
	|x current pid|
	pid := self currentPopulationID.
	pid ifNotNil: [
		current := (population at: pid).
		x := current atParameter: aSymbol
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