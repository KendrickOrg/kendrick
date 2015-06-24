as yet unclassified
dataAt: aCountryName
	^ data detect: [ :ts | (ts compartment at: #country) == aCountryName ]