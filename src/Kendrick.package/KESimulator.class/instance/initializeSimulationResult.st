initialization
initializeSimulationResult
	data := Dictionary new.
	model population compartments keys do: [ :each | data at: each put: KETimeSeries new ]