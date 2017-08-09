initialization
initializeContactNetwork
	| gridSize |
	gridSize := 400.
	network := KEKleinbergContactNetwork new
		nodes: (1 to: gridSize);
		n: 20;
		p: 1;
		q: 1;
		r: 5;
		run.
	network nodes do: [ :each | each currentStatus: #S ].
	network nodes first currentStatus: #I