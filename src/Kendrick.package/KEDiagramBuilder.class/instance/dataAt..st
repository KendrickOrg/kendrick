as yet unclassified
dataAt: key
	^ data detect: [ :ts | (ts compartment at: #country) == key ]