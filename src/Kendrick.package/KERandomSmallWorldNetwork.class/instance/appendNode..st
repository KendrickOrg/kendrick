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
				network with: (Array with: label with: (network nodes at: ((activeNodes size) * (rand next)) ceiling) label) strengthOfConnection: strengthOfConnection
				]
			ifFalse: [  
				network with: (Array with: label  with: (network nodes at: i) label) strengthOfConnection: strengthOfConnection
				]
			]
		].
	activeNodes add: j
	