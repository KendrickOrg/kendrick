as yet unclassified
generateEvents
	|moveEvents N|
	moveEvents := Dictionary new.
	N := model populationIDs size.
	model populationIDs do: [ :pid| moveEvents at: pid put: (OrderedCollection new) ].
	1 to: (N-1) do: [ :i| 
		(i+1) to: N do: [ :j| |rates pid_i pid_j|
		pid_i := model populationIDs at: i.
		pid_j := model populationIDs at: j.
		rates := self rates: pid_i and: pid_j.
		model compartmentSymbols keys do: [ :symbol| 
			(moveEvents at: pid_i) add: (KEMovementEvent new: symbol from: pid_i to: pid_j rate: (rates at: 1)).
			(moveEvents at: pid_j) add: (KEMovementEvent new: symbol from: pid_j to: pid_i rate: (rates at: 2)).
			]
		]
	].
	^ moveEvents
