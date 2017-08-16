metrics
c4: aNode
	"Return the number of square (cycle of length 4) starting from aNode"

	| pathTree res |
	res := OrderedCollection new.
	pathTree := OrderedCollection new.
	pathTree := self pathOfLength: 3 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors |
			neighbors := self neighborsOf: (eachPath at: 4).
			(neighbors includes: aNode)
				ifTrue: [ res addIfNotPresent: eachPath asSet ] ].
	
	^ res size