as yet unclassified
edges: anAssociation weight: aSymbol values: weights
	|values arrOfAssoc attribute|
	attribute := anAssociation value.
	arrOfAssoc := anAssociation key.
	((arrOfAssoc size = 1) and: [ arrOfAssoc first key = #all ]) 
		ifTrue: [ self edges: #all ]
		ifFalse: [ 
			 self edges: (arrOfAssoc collect: [:e| Array with: (Dictionary newFrom: {attribute->e key first}) with: (Dictionary newFrom: {attribute->e key second})])
			 ].
	weights size = 1 
	ifTrue: [ 
		values := Array new: edges size.
		1 to: edges size do: [ :i| values at: i put: weights first ] ]
	ifFalse: [ values := weights ].
	1 to: edges size do: [ :id|
		self with: (edges at: id) weight: aSymbol value: (values at: id)
	 ]
	
	
	