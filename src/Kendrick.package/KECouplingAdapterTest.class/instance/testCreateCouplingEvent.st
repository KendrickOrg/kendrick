as yet unclassified
testCreateCouplingEvent
	|model couplingAdapter eventGenerator events|
	model := self createAMetaPopulationModel.
	couplingAdapter := KECouplingAdapter new.
	couplingAdapter atArgument: #model put: model.
	couplingAdapter init.
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model..
	model currentSubPopulation: (model subPopulations first).
	self assert: (events size) equals: 2.
	self assert: (events first evaluateWithModel: model) equals: 0.04