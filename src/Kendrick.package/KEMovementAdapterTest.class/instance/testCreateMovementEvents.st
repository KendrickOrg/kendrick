as yet unclassified
testCreateMovementEvents
	|model movementAdapter eventGenerator events|
	model := self createSIRMetaPopulationWithMovementModel.
	movementAdapter := KEMovementAdapter new.
	movementAdapter atArgument: #model put: model.
	movementAdapter init.
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	events := (model population at: #(0 1)) events.
	model currentPopulationID: #(0 1).
	self assert: (events size) equals: 12 