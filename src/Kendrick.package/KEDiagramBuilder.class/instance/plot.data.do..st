accessing
plot: anObject data: data do: aFunction
	|aCollectionOfTimeSeries|
	aCollectionOfTimeSeries := self prepareData: data for: anObject do: aFunction.
	(anObject isSymbol) & (aCollectionOfTimeSeries isCollection not ) 
	ifTrue: [ self plotSingleDiagram: anObject data: aCollectionOfTimeSeries ]
	ifFalse: [ 
		|statusCollection|
		statusCollection := anObject.
		anObject isSymbol ifTrue: [ 
			statusCollection := OrderedCollection new.
			1 to: aCollectionOfTimeSeries size do: [ :i|
				statusCollection add: (anObject asString, i asString) asSymbol
				 ]
			 ].
		self plotCompositeDiagram: statusCollection data: aCollectionOfTimeSeries 
		]
	