as yet unclassified
commutingRateOf: nodeLabel
	"calculating sum(sigma_jr/tau_jr). If tau = const, it becomes (sigma_j/tau), sigma_j=sum(sigma_jr) with r is adjacentNode of j"
	|nodeJ sum|
	nodeJ := self atNode: nodeLabel.
	sum := 0.
	nodeJ adjacentNodes keysDo: [ :k| 
		|ed|
		ed := nodeLabel->k.
		sum := sum + (leaveRates at: ed)/(returnRates at: ed).
	].
	^ sum
	