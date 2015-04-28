as yet unclassified
plot: anObject population: aPID do: aFunction
	"This method will call a diagram builder to visualize all compartments in 'anObject' of the sub-population with aPID as id"
	|diagBuilder|
	diagBuilder := KEDiagramBuilder new.
	^ diagBuilder plot: anObject data: (self data at: aPID) do: aFunction
	