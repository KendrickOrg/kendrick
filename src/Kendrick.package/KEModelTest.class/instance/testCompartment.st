tests
testCompartment
	|model|
	model := KEModel new.
	self assert: (model compartments size) equals: 0.
	model attributes: { 
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2) }.
	self assert: (model compartments size) equals: 9.
	self assert: (model compartments first nbAttributes) equals: 2 