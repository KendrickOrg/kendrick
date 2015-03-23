as yet unclassified
adaptTo: aModel
	|graph stts att|
	self atArgument: #model put: aModel.
	graph := self atArgument: #graph.
	att := graph attribute.
	stts := self model population attributes at: #status.
	"Generate automatically a list of immigration transitions for the model"
	graph nodes do: [ :node|
		node adjacentNodes keysAndValuesDo: [ :k :v|
			((k ~= node label) and: [ v first value ~= 0 ]) ifTrue: [ 
				stts do: [ :s||tmp1 tmp2|
					tmp1 := Dictionary newFrom: {att->(node label)}.
					tmp2 := Dictionary newFrom: {att->k}.
					tmp1 at: #status put: s. tmp2 at: #status put: s.
					self model transitions add: 
						(KETransition from: tmp1 to: tmp2 rate: (KENumerical new number: v first value)) ]
				 ]
			 ]
		 ]