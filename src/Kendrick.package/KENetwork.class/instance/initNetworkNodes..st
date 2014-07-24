as yet unclassified
initNetworkNodes: nbInds
	1 to: nbInds do: [ :i| nodes add: (KENetworkNode new) ].
	^ self initNetwork
	
	
