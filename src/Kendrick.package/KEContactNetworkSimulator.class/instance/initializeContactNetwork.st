initialization
initializeContactNetwork
	| gridSize |
	gridSize := 20.
	network := KEKleinbergContactNetwork new
		nodes: (1 to: gridSize*gridSize);
		n: gridSize;
		p: 1;
		q: 1;
		r: 5;
		run.
	network nodes do: [ :each | each currentStatus: #S ].
	network nodes first currentStatus: #I