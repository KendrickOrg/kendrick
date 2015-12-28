tests
testAttributes
	|model|
	model := KEModel new.
	model attributes: { 
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2) }.
	
	self assert: (model attributes at: #status) size equals: 3.
	self assert: (model attributes at: #species) size equals: 3