tests-as yet unclassified
testCompartmentNames
	|model|
	model := KEModel new.
	self assert: (model compartmentNames size) equals: 0.
	model attributes: { 
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2) }.
	self assert: (model compartmentNames size) equals: 9.
	self assert: (model compartmentNames first size) equals: 2 