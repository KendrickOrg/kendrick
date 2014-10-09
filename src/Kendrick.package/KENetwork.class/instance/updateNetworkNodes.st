as yet unclassified
updateNetworkNodes
	"This method will update the status name of all the nodes in the network, following the status of all individuals of the population"
	1 to: nodes size do: [ :i|
		(population indList at: i) isAlive ifTrue: [ (nodes at: i) name: (population indList at: i) currentStatus asSymbol] ifFalse: [ (nodes at: i) name: nil ]
		 ]
