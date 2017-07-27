as yet unclassified
initialize
	super initialize.
	stream := WriteStream on: (String new: 60).
	strInitializeTrans := WriteStream on: (String new: 60).
	compartments := Dictionary new.
	parameters := Dictionary new.
	equaChecks := Dictionary new.
	nbOfCompartments := 0.
	eventIndex := -1.
	defSumSigma := false.
	isDeterministic := true.
	function := ''