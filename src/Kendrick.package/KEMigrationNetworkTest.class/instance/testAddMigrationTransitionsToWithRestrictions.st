as yet unclassified
testAddMigrationTransitionsToWithRestrictions
	|model g|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model attributes: {#status->#(#S #I #ISym #R). #region->#(#A #B #C)}.
	
	g := KEMigrationNetwork newOn: model atAttribute: #region.
	g edges: #all; strengthOfAllConnections: 0.005; restrictions: {#status->#ISym}.
	g addMigrationTransitionsTo: model.
	
	self assert: model transitions size equals: 18