tests-as yet unclassified
testCompartment
	|concern|
	concern := KEModelPart new.
	self assert: (concern compartments size) equals: 0.
	concern addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: (concern compartments size) equals: 3.
	self assert: (concern compartments first nbAttributes) equals: 1