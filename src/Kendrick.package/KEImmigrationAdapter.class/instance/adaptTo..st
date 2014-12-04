as yet unclassified
adaptTo: aModel
	|graph keys|
	self atArgument: #model put: aModel.
	graph := self atArgument: #graph.
	keys := graph nodes keys.
	"Generate automatically a list of immigration transitions for the model"
	