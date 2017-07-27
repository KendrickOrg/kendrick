initialization
initializeTimeSeries
	timeSeries := OrderedCollection new.
	model population compartments
		keysDo: [ :arg1 | timeSeries add: (KETimeSeries new compartment: arg1) ]