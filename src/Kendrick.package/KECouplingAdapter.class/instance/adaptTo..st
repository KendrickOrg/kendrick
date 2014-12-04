as yet unclassified
adaptTo: aModel
	|graph keys|
	self atArgument: #model put: aModel. 
	graph := self atArgument: #graph.
	keys := graph nodes keys.
	"Generate automatically a list of paramters for the model"
	graph nodes do: [ :node| |tmp param|
		tmp := self model parameters at: node label ifAbsentPut: (Dictionary new).
		node adjacentNodes keysAndValuesDo: [ :k :v| |d|
			param := v key.
			d := tmp at: v key ifAbsentPut: Dictionary new.
			d at: k put: v value
			 ].
		keys do: [ :k| (tmp at: param) at: k ifAbsentPut: 0.0 ]
		 ]
	