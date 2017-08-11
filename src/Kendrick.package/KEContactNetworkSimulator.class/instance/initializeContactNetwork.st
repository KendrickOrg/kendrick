initialization
initializeContactNetwork
	| gridSize |
	gridSize := 25.
	network := KEKleinbergContactNetwork new
		nodes: (1 to: gridSize * gridSize);
		n: gridSize;
		p: 1;
		q: 1;
		r: 2;
		run