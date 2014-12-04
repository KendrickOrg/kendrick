as yet unclassified
adaptTo: aModel
	|graph keys stts|
	self atArgument: #model put: aModel.
	graph := self atArgument: #graph.
	keys := graph nodes keys.
	stts := self model population attributes at: #status.
	"Generate automatically a list of immigration transitions for the model"
	graph nodes do: [ :node|
		|tmp1|
		tmp1 := node label copy.
		node adjacentNodes keysAndValuesDo: [ :k :v||tmp2|
			tmp2 := k copy.
			((k ~= node label) and: [ v value ~= 0 ]) ifTrue: [ 
				stts do: [ :s| tmp1 at: #status put: s. tmp2 at: #status put: s.
					self model transitions add: 
						(KETransition from: tmp1 to: tmp2 rate: (KENumerical new number: v value)) ]
				 ]
			 ]
		 ]