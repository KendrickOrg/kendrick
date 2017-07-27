tests-as yet unclassified
testAddAttributeValue
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		addAttribute: #species
		value: #(#mosquito #reservoir1 #reservoir2).
	self assert: tmp1 attributes size equals: 1