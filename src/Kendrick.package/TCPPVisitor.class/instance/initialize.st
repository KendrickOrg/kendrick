as yet unclassified 
initialize
	super initialize.
	stream := WriteStream on: (String new: 60).
	strInitializeTrans := WriteStream on: (String new: 60).		
	"ThanhNT 10/7"
	"compartments := Dictionary new."
	"Endof ThanhNT 10/7"
	parameters := Dictionary new.
	equaChecks := Dictionary new.
	"ThanhNT 10/7"
	"nbOfCompartments := 0."
	"Endof ThanhNT 10/7"
	eventIndex := -1.
	defSumSigma := false.
	isDeterministic := true.
	function := ''.

	
