metrics
c4: aNode
	"Return the number of square (cycle of length 4) starting from aNode"

	| pathTree result |
	result := OrderedCollection new.
	pathTree := self pathOfLength: 3 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors |
			neighbors := self neighborsOf: (eachPath at: 4).
			(neighbors includes: aNode)
				ifTrue: [ result addIfNotPresent: eachPath asSet ] ].
	^ result size