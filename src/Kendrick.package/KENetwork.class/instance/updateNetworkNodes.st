as yet unclassified
updateNetworkNodes
	"This method will update the status name of all the nodes in the network, following the status of all individuals of the population"
	1 to: nodes size do: [ :i|
		(population individuals at: i) isAlive ifTrue: [ (nodes at: i) name: (population individuals at: i) currentStatus asSymbol] ifFalse: [ (nodes at: i) name: nil ]
		 ]
