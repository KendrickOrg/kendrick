as yet unclassified
appendNode: anAssociation
	|nodeIdx graph rand j|
	nodeIdx := anAssociation key.
	graph := anAssociation value.
	rand := Random new.
	j := nodeIdx.
	activeNodes do: [ :i| 
		((((i-j) abs ) \\ (graph nodes size - (K // 2))) <= (K // 2))
		ifTrue: [ 
			(beta > (rand next)) 
			ifTrue: [ 
				"rewiring the edge (i->j) with i < j"
				|node_k node_i k|
				node_i := graph nodes at: i.
				node_k := node_i.
				[ (node_k label ~= node_i label) 
					and: [ (node_i adjacentNodes select: [ :e| e = node_k label ]) isEmpty ]
				] whileFalse: 
					[ 
						k := ((graph nodes size) * (rand next)) ceiling.
						node_k := (graph nodes at: k) 
					].
				graph edgesFrom: (graph nodes at: i) label toAll: (Array with: (graph nodes at: k) label) oneWay: true.
				"add the edge (j->i) with j > i"
				graph edgesFrom: (graph nodes at: j) label toAll: (Array with: (graph nodes at: i) label) oneWay: true.
			]
			ifFalse: [  
				graph edgesFrom: (graph nodes at: j) label toAll: (Array with: (graph nodes at: i) label).
				"((j = graph nodes size) and: [i = 1]) 
				ifTrue: 
					[ network with: (Array with: j  with: i) strengthOfConnection: strengthOfConnection oneWay: oneWay ] 
				ifFalse: 
					[ network with: (Array with: i  with: j) strengthOfConnection: strengthOfConnection oneWay: oneWay ]"
				]
			]
		].
	activeNodes add: j
	