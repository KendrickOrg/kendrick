as yet unclassified
weight: aSymbol values: weights
	weights isCollection 
	ifTrue: [ 
		1 to: edges size do: [ :id|
			self with: (edges at: id) weight: aSymbol value: (weights at: id)
			 ]
		 ]
	ifFalse: [ 
		edges do: [ :each| self with: each weight: aSymbol value: weights ]
		 ]
	
	