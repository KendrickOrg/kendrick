as yet unclassified
buildLegends
	legends := data collect: [ :ts | ts compartment associations asString ]