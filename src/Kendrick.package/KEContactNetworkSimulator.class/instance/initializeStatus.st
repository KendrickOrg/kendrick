initialization
initializeStatus
	network nodes do: [ :each | each currentStatus: #S ].
	network nodes first currentStatus: #I; genInfected: 1