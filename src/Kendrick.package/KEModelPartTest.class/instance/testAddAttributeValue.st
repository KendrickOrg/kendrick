tests-as yet unclassified
testAddAttributeValue
	|c|
	c := KEModelPart new.
	c addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: c attributes size equals: 1