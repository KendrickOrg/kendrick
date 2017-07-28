general
clones: aConcern
	self transitions: aConcern transitions.
	attributes := Dictionary new.
	aConcern attributes keysAndValuesDo: [ :k :v| 
		attributes at: k put: v
		].
	parameters := Dictionary new.
	aConcern parameters keysAndValuesDo: [ :k :v| 
		parameters at: k put: v
		].