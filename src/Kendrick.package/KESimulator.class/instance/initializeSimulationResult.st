initialization
initializeSimulationResult
	result := OrderedCollection new.
	model population compartments
		keysDo: [ :each | result add: (KETimeSeries new compartment: each) ]