as yet unclassified
edges: edgeCollection weight: aSymbol values: weights
	|symbol|
	self edges: edgeCollection.
	((aSymbol = #move) | (aSymbol = #movement)) ifTrue: [ symbol := #movement ] ifFalse: [ symbol := aSymbol ]. 	
	self weightNames add: symbol.
	weights isCollection 
	ifTrue: [ 
		1 to: edges size do: [ :id|
			self with: (edges at: id) weight: symbol value: (weights at: id)
			 ]
		 ]
	ifFalse: [ 
		edges do: [ :each| self with: each weight: symbol value: weights ]
		 ]
	
	