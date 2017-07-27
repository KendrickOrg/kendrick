as yet unclassified
buildLegends
	legends := data
		collect: [ :arg1 | arg1 compartment associations asString ]