as yet unclassified
initNetworkNodes: nbInds
	1 to: nbInds do: [ :i| nodes add: (KENetworkNode new name: (population individuals at: i) currentStatus asSymbol) ].
	^ self initNetwork
	
	
