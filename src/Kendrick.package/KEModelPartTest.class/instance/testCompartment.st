tests-as yet unclassified
testCompartment
	| tmp1 |
	tmp1 := KEModelPart new.
	self assert: tmp1 compartments size equals: 0.
	tmp1
		addAttribute: #species
		value: #(#mosquito #reservoir1 #reservoir2).
	self
		assert: tmp1 compartments size equals: 3;
		assert: tmp1 compartments first nbAttributes equals: 1