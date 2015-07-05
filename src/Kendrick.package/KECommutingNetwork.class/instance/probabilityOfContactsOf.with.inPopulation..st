as yet unclassified
probabilityOfContactsOf: source with: destination inPopulation: population
	"infected contacts come from two source of individuals, infected on the local location and from neighbouring location during their travelling"
	|firstContactLevel localNode effectiveContacts|
	firstContactLevel := 2. 
	localNode := self atNode: {self attribute->(source at: self attribute)}.
	effectiveContacts := population processLevel: firstContactLevel sourceNode: source destinationNode: destination.
	effectiveContacts := effectiveContacts / (1 + self commutingRateOf: localNode).
	localNode adjacentNodes keysDo: [ :k| 
		|tmp travelRate ed travelContact|
		tmp := source copy.
		tmp at: (self attribute) put: ((Dictionary newFrom: k) at: (self attribute)).
		ed := (localNode label)->k.
		travelRate := (leaveRates at: ed)/(returnRates at: ed).
		travelRate := travelRate / (1 + (self commutingRateOf: (self atNode: k))).
		travelContact := population processLevel: firstContactLevel sourceNode: tmp destinationNode: destination.
		effectiveContacts := effectiveContacts + (travelRate * travelContact)	
	].
	^ effectiveContacts 