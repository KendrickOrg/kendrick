accessing
nodes: aCollectionOfName
	aCollectionOfName do: [ :eachName|
		nodes at: eachName put: (KENode new label: eachName)
		 ].
	