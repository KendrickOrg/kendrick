accessing
atCompartment: aSymbol
	"This function is only called in the case that the subPopulations is a list of compartments"
	subPopulations do: [ :each|
		each status = aSymbol ifTrue: [ ^ each ]
		 ].
	^ nil
	