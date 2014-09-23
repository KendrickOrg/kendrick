as yet unclassified
generateMovementEvents
	|model movementEvents N|
	model := self model.
	movementEvents := Dictionary new.
	N := model populationIDs size.
	model compartmentSymbols keys do: [ :symbol| 
		movementEvents at: symbol put: (Dictionary new).
		model populationIDs do: [ :pid| 
			(movementEvents at: symbol) at: pid put: (OrderedCollection new)
			]
		]. 
	1 to: (N-1) do: [ :i| 
		(i+1) to: N do: [ :j| |rates pid_i pid_j| 
			pid_i := model populationIDs at: i.
			pid_j := model populationIDs at: j.
			rates := self moveRatesFrom: pid_i to: pid_j.
			model compartmentSymbols keys do: [ :symbol| |events|
				events := OrderedCollection new.
				events add: (KEMovementEvent new: symbol from: pid_i to: pid_j rate: (rates at: 1)).
				events add: (KEMovementEvent new: symbol from: pid_j to: pid_i rate: (rates at: 2)).
				((movementEvents at: symbol) at: pid_i) addAll: events. 
				((movementEvents at: symbol) at: pid_j) addAll: events.
				] 
			]
		].
	^ movementEvents
	