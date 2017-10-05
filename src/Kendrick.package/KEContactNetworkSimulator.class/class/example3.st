examples
example3
	| mean result graph n g |
	result := (1 to: 100)
		collect: [ :each | 
			graph := KETriangularContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				m: 25.
			n := KEContactNetworkSimulator fromNetwork: graph.
			g := n network.
			50 timesRepeat: [ n step ].
			graph r0 ].
	result := result reject: [ :each | each == Float nan ].
	mean := 0.
	result do: [ :each | mean := mean + each ].
	mean := mean / result size.
	mean