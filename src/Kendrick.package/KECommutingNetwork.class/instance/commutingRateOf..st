as yet unclassified
commutingRateOf: node
	"calculating sum(sigma_jr/tau_jr). If tau = const, it becomes (sigma_j/tau), sigma_j=sum(sigma_jr) with r is adjacentNode of j"
	|sum|
	sum := 0.
	node adjacentNodes keysDo: [ :k| 
		|ed|
		ed := (node label)->k.
		sum := sum + ((leaveRates at: ed)/(returnRates at: ed)).
	].
	^ sum
	