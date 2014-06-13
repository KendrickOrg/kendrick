as yet unclassified
nodes: aCollection
	aCollection isNumber
	ifTrue: [
		nodeNames := OrderedCollection new.
		1 to: aCollection do: [ :each|
			|node|
			node := KENode new.
			nodes add: node.
			nodeNames add: each.
			 ]
		 ]
	ifFalse: [ 
		aCollection do: [ :each|
		|node|
		node := KENode new.
		nodes add: node
		 ].
		nodeNames := aCollection
		 ]
	