as yet unclassified
loopEdges: anAssoc weight: aSymbol values: weights
	|values arrOfAssoc attribute edgeCollection|
	attribute := anAssoc value.
	arrOfAssoc := anAssoc key.
	weights size = 1 
	ifTrue: [ 
		values := Array new: self nodes size.
		1 to: values size do: [ :i| values at: i put: weights first ] ]
	ifFalse: [ values := weights ].
	((arrOfAssoc size = 1) and: [ arrOfAssoc first key = #all ])
	ifTrue: [ 
		edgeCollection := self nodes keys collect: [ :e| Array with: e with: e ]
		 ]
	ifFalse: [ 
		edgeCollection := arrOfAssoc collect: [ :e| Array with: (attribute->e key) with: (attribute->e key) ]
		 ].
	edges addAll: edgeCollection.
	1 to: edgeCollection size do: [ :id|
		self with: (edgeCollection at: id) weight: aSymbol value: (values at: id)
	 ]
	
	
	