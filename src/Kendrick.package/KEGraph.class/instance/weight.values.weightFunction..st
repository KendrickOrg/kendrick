as yet unclassified
weight: aSymbol values: weightCollection weightFunction: aBlock
	|weights|
	weights := OrderedCollection new.
	weightCollection = #id ifTrue: [ 
		edges do: [ :each|
			weights add: (aBlock value: (each at: 1) value: (each at: 2))
			 ]
		 ].
	weightCollection isCollection ifTrue: [ 
		weightCollection do: [ :each| weights add: (aBlock value: each) ]
		 ].
	self weight: aSymbol values: weights