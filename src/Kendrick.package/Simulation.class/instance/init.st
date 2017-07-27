protected
init
	algo = #testGillespie
		ifTrue: [ | tmp2 |
			simulator := KEGillespieSimulatorForTesting new.
			tmp2 := simulator.
			tmp2
				tMin: from;
				tMax: to;
				step: step ]
		ifFalse: [ simulator := KESimulator
				new: algo
				from: from
				to: to
				by: step ]