initialization
initializeSimulationResult
	timeSeriesOutputs := OrderedCollection new.
	model population compartments
		keysDo: [ :each | timeSeriesOutputs add: (KETimeSeries new compartment: each) ]