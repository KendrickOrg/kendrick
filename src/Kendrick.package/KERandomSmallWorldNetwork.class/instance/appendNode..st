as yet unclassified
appendNode: aNodeLabel
	|label j rand|
	label := aNodeLabel key.
	j := aNodeLabel value.
	rand := Random new.
	activeNodes do: [ :i| 
		((((i-j) abs ) \\ (network nodes size - (K // 2))) <= (K // 2))
		ifTrue: [ 
			(beta > (rand next)) 
			ifTrue: [ 
				"rewiring the edge (i->j) with i < j"
				|node_k node_i k|
				node_i := network nodes at: i.
				node_k := node_i.
				[ (node_k label ~= node_i label) 
					and: [ (node_i adjacentNodes at: node_k label ifAbsent: [ nil ]) isNil ]
				] whileFalse: 
					[ 
						k := ((network nodes size) * (rand next)) ceiling.
						node_k := (network nodes at: k) 
					].
				network 
					with: (Array with: i with: k) 
					strengthOfConnection: strengthOfConnection oneWay: true.
				"add the edge (j->i) with j > i"
				network 
					with: (Array with: j  with: i) 
					strengthOfConnection: strengthOfConnection oneWay: true. 
				]
			ifFalse: [  
				network with: (Array with: j  with: i) strengthOfConnection: strengthOfConnection
				]
			]
		].
	activeNodes add: j
	