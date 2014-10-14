as yet unclassified
generateMovementEvents
	|model movementEvents N|
	model := self model.
	movementEvents := Dictionary new.
	N := model subPopulations size.
	model compartmentSymbols keys do: [ :symbol| 
		movementEvents at: symbol put: (Dictionary new).
		model subPopulations do: [ :pop| 
			(movementEvents at: symbol) at: (pop name) put: (OrderedCollection new)
			]
		]. 
	1 to: (N-1) do: [ :i| 
		(i+1) to: N do: [ :j| |rates pop_i pop_j| 
			pop_i := model subPopulations at: i.
			pop_j := model subPopulations at: j.
			rates := self moveRatesFrom: pop_i to: pop_j.
			model compartmentSymbols keys do: [ :symbol| |events|
				events := OrderedCollection new.
				events add: (KEMovementEvent new: symbol from: pop_i to: pop_j rate: (rates at: 1)).
				events add: (KEMovementEvent new: symbol from: pop_j to: pop_i rate: (rates at: 2)).
				((movementEvents at: symbol) at: pop_i name) addAll: events. 
				((movementEvents at: symbol) at: pop_j name) addAll: events.
				] 
			]
		].
	^ movementEvents
	