as yet unclassified
testCreateCouplingEvent
	|model couplingAdapter eventGenerator events|
	model := self createAMetaPopulationModel.
	couplingAdapter := KECouplingAdapter new.
	couplingAdapter atArgument: #model put: model.
	couplingAdapter init.
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	events := (model population at: #(0 1)) events.
	model currentPopulationID: #(0 1).
	self assert: (events size) equals: 2.
	self assert: (events first evaluateWithModel: model) equals: 0.04