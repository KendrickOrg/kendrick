tests
testBuildACompartmentFromDictionary
	| tmp1 |
	tmp1 := KECompartment
		from:
			{(#status -> #I).
			(#patch -> #'1')}.
	self assert: tmp1 nbAttributes equals: 2