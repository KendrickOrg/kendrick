tests-as yet unclassified
testCompartmentNames
	|concern|
	concern := KEModelPart new.
	self assert: (concern compartmentNames size) equals: 0.
	concern addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: (concern compartmentNames size) equals: 3.
	self assert: (concern compartmentNames first size) equals: 1