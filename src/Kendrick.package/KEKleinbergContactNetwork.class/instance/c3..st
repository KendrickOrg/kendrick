metrics
c3: aNode
	"Return the number of triangle (cycle of length 3) starting from aNode"

	| pathTree res |
	res := OrderedCollection new.
	pathTree := OrderedCollection new.
	pathTree := self pathOfLength: 2 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors |
			neighbors := self neighborsOf: (eachPath at: 3).
			(neighbors includes: aNode)
				ifTrue: [ res addIfNotPresent: eachPath asSet ] ].
	^ res size