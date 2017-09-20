metrics
pathOfLength: aNumber startingFrom: aNode
	"Return an ordered collection of paths (path= ordered collection f nodes number)"

	aNumber = 0
		ifTrue: [ ^ OrderedCollection with: (OrderedCollection with: aNode) ]
		ifFalse: [ | result |
			result := OrderedCollection new.
			(self neighborsOf: aNode)
				do: [ :each | 
					| result1 |
					result1 := OrderedCollection new.
					(self pathOfLength: aNumber - 1 startingFrom: each)
						do: [ :eachPath | 
							(eachPath includes: aNode)
								ifFalse: [ result1
										add:
											(eachPath
												addFirst: aNode;
												yourself) ] ].
					result addAll: result1 ].
			^ result ]