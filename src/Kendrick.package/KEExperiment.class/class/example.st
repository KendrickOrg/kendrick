example
example
	|  experiment result mean |
	experiment := self class new
		name: #experiment1;
		runs: 100.
	experiment
		executeBlock: [:each| | n g graph |
			graph := KETriangularContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				m: 25.
			n := KEContactNetworkSimulator fromNetwork: graph.
			g := n network.
			50 timesRepeat: [ n step ].
			graph r0 ].
	experiment run.
	result := experiment results.
	result := result reject: [ :each | each == Float nan ].
	mean := 0.
	result do: [ :each | mean := mean + each ].
	mean := mean / result size.
	^ mean