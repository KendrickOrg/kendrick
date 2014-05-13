as yet unclassified
edges: edgeCollection weight: aSymbol values: weights
	self edges: edgeCollection.
	weights isCollection 
	ifTrue: [ 
		1 to: edges size do: [ :id|
			self with: (edges at: id) weight: aSymbol value: (weights at: id)
			 ]
		 ]
	ifFalse: [ 
		edges do: [ :each| self with: each weight: aSymbol value: weights ]
		 ]
	
	