metrics
cc4: aNode
	"Return the number of square (cycle of length 4)+chord starting from aNode"

	| pathTree res |
	res := OrderedCollection new.
	pathTree := OrderedCollection new.
	pathTree := self pathOfLength: 3 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors1 neighbors2 |
			neighbors1 := self neighborsOf: (eachPath at: 4).
			neighbors2 := self neighborsOf: (eachPath at: 3).
			((neighbors1 includes: aNode)
				and: [ neighbors2 includes: aNode ])
				ifTrue: [ res addIfNotPresent: eachPath asSet ] ].
	^ res size