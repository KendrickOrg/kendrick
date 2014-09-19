accessing
plot: anObject data: data do: aFunction
	|aCollectionOfTimeSeries|
	aCollectionOfTimeSeries := self prepareData: data for: anObject do: aFunction.
	(anObject isSymbol) & (aCollectionOfTimeSeries isCollection not ) 
	ifTrue: [ self plotSingleDiagram: anObject data: aCollectionOfTimeSeries ]
	ifFalse: [ self plotCompositeDiagram: anObject data: aCollectionOfTimeSeries ]
	