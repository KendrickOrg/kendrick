as yet unclassified
adaptTo: aModel
	|graph attribute keys|
	self atArgument: #model put: aModel. 
	graph := self atArgument: #graph.
	attribute := graph attribute.
	keys := graph nodes collect: [ :n| Dictionary newFrom: {attribute->(n label)} ].
	"Generate automatically a list of paramters for the model"
	graph nodes do: [ :node| |tmp params|
		params := OrderedCollection new.
		tmp := self model parameters at: (Dictionary newFrom: {attribute->(node label)}) ifAbsentPut: (Dictionary new).
		node adjacentNodes keysAndValuesDo: [ :k :v| |d|
			v do: [ :e| 
				params add: e key. 
				d := tmp at: e key ifAbsentPut: Dictionary new.
				d isDictionary 
				ifFalse: [ 
					|x|
					x := Dictionary new.
					x at: (Dictionary newFrom: {attribute->node label}) put: d.
					tmp at: e key put: x.
					d := tmp at: e key  ]
				ifTrue: [ 
					d at: (Dictionary newFrom: {attribute->node label}) ifAbsentPut: 0.0 ].
				d at: (Dictionary newFrom: {attribute->k}) put: e value
			]
		].
		params do: [ :p| keys do: [ :k| (tmp at: p) at: k ifAbsentPut: 0.0 ] ]
	]
	