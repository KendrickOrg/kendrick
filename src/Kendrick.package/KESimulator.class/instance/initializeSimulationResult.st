initialization
initializeSimulationResult
	data := OrderedCollection new.
	model population compartments keys do: [ :each | data add:((KETimeSeries new) compartment: each)]