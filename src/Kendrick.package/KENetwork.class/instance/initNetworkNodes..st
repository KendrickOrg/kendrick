as yet unclassified
initNetworkNodes: nbInds
	1 to: nbInds do: [ :i| nodes add: (KENetworkNode new name: (population indList at: i) currentStatus asSymbol) ].
	^ self initNetwork
	
	
