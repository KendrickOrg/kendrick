as yet unclassified
generateMovementEvents: model
	|events e1 e2 e3 e4 e5 e6|
	events := Dictionary new.
	e1 := KEMovementEvent new: #S from: (model subPopulations at: 1) to: (model subPopulations at: 2) rate: 0.001.
	e2 := KEMovementEvent new: #S from: (model subPopulations at: 1) to: (model subPopulations at: 3) rate: 0.001.
	e3 := KEMovementEvent new: #S from: (model subPopulations at: 2) to: (model subPopulations at: 1) rate: 0.001.
	e4 := KEMovementEvent new: #S from: (model subPopulations at: 2) to: (model subPopulations at: 3) rate: 0.001.
	e5 := KEMovementEvent new: #S from: (model subPopulations at: 3) to: (model subPopulations at: 2) rate: 0.001.
	e6 := KEMovementEvent new: #S from: (model subPopulations at: 3) to: (model subPopulations at: 1) rate: 0.001.
	events at: #'01' put: (OrderedCollection new).
	events at: #'02' put: (OrderedCollection new).
	events at: #'03' put: (OrderedCollection new).
	(events at: #'01') addAll: { e1. e2. e3. e6 }.
	(events at: #'02') addAll: { e1. e5. e3. e4 }.
	(events at: #'03') addAll: { e4. e2. e5. e6 }.  
	^ events