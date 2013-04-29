as yet unclassified
initialize
	super initialize.
	stream := WriteStream on: (String new: 60).
	compartments := Dictionary new.
	parameters := Dictionary new.
	nbOfCompartments := 0.
