as yet unclassified
effectiveSizeOf: source population: population
"calculing the effective population size in each subpopulation, the actual number of individuals actually staying at this location"
	|localNode effectiveSize|
	localNode := self atNode: {self attribute->(source at: self attribute)}.
	"size of local location"
	effectiveSize := (population sizeOfCompartments: localNode label).
	effectiveSize := effectiveSize / (1 + (self commutingRateOf: localNode)).
	localNode adjacentNodes keysDo: [ :k| 
		|travelRate ed|
		ed := (localNode label)->k.
		travelRate := (leaveRates at: ed)/(returnRates at: ed).
		travelRate := travelRate / (1 + (self commutingRateOf: (self atNode: k))).
		effectiveSize := effectiveSize + (travelRate * (population sizeOfCompartments: k)).
	].
	^ effectiveSize 