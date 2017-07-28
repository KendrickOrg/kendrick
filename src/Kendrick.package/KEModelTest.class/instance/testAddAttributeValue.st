tests
testAddAttributeValue
	|model|
	model := KEModel new.
	model attributes: { 
		#status->#(#S #I #R). 
		}.
	model addAttribute: #species value: #(#reservoir1 #reservoir2 #mosquito).
	self assert: (model attributes at: #status) size equals: 3.
	self assert: (model attributes at: #species) size equals: 3