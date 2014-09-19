accessing
plot: anObject data: data do: aFunction
	|models|
	models := self prepareData: data for: anObject do: aFunction.
	"models will be a collection of TimeSeries"
	(anObject isSymbol) & (models isCollection not ) 
	ifTrue: [ self plotSingleDiagram: anObject data: models ]
	ifFalse: [ self plotCompositeDiagram: anObject data: models ]
	