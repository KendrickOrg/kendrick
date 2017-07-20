initialization
initializeTimeSeriesOutputs
	timeSeries := OrderedCollection new.
	model population compartments
		keysDo: [ :each | timeSeries add: (KETimeSeries new compartment: each) ]