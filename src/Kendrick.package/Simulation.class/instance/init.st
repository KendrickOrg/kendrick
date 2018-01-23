protected
init

	algo = #testGillespie
		ifTrue: [ simulator := (KEGillespieSimulatorForTesting new). 
							simulator tMin: from; tMax: to; step: step ]
		ifFalse: [  simulator := KESimulator new: algo from: from to: to step: step ]