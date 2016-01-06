as yet unclassified
testAddMigrationTransitionsTo
	|model g|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model attributes: {#status->#(#S #I #R). #region->#(#A #B #C)}.
	
	g := KEMigrationNetwork newOn: model atAttribute: #region.
	g edges: #all; strengthOfAllConnections: 0.005.
	g addMigrationTransitionsTo: model.
	self assert: model transitions size equals: 18