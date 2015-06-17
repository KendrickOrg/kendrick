initialization
initializeSimulationResult
	result := OrderedCollection new.
	model population compartments keys do: [ :each | result add:((KETimeSeries new) compartment: each)]