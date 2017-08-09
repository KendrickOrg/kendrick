initialization
initializeContactNetwork
	| gridSize |
	gridSize := 100.
	network := KEKleinbergContactNetwork new
		nodes: (1 to: gridSize);
		n: 10;
		p: 1;
		q: 0;
		r: 0;
		run.
	network nodes do: [ :each | each currentStatus: #S ].
	network nodes first currentStatus: #I