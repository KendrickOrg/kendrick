as yet unclassified
generateMovementEvents
	|events e1 e2 e3 e4 e5 e6|
	events := Dictionary new.
	e1 := KEMovementEvent new: #S from: #(0 1) to: #(0 2) rate: 0.001.
	e2 := KEMovementEvent new: #S from: #(0 1) to: #(0 3) rate: 0.001.
	e3 := KEMovementEvent new: #S from: #(0 2) to: #(0 1) rate: 0.001.
	e4 := KEMovementEvent new: #S from: #(0 2) to: #(0 3) rate: 0.001.
	e5 := KEMovementEvent new: #S from: #(0 3) to: #(0 2) rate: 0.001.
	e6 := KEMovementEvent new: #S from: #(0 3) to: #(0 1) rate: 0.001.
	events at: #(0 1) put: (OrderedCollection new).
	events at: #(0 2) put: (OrderedCollection new).
	events at: #(0 3) put: (OrderedCollection new).
	(events at: #(0 1)) addAll: { e1. e2. e3. e6 }.
	(events at: #(0 2)) addAll: { e1. e5. e3. e4 }.
	(events at: #(0 3)) addAll: { e4. e2. e5. e6 }.  
	^ events