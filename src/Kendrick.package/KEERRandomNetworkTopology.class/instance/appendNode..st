as yet unclassified
appendNode: anAssociation
	|label graph rand|
	label := anAssociation key.
	graph := anAssociation value.
	rand := Random new.
	activeNodes do: [ :node| 
		(p > (rand next)) ifTrue: [ 
			graph edgesFrom: label toAll: (Array with: node)  ]
		].
	activeNodes add: label