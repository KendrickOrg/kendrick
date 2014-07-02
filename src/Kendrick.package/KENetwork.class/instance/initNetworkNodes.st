as yet unclassified
initNetworkNodes
	1 to: (self nbInd) do: [ :i| nodes add: (KENetworkNode new) ].
	^ self launch
	
	
