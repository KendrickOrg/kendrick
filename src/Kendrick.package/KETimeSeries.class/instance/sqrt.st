accessing
sqrt
	^ KETimeSeries from: (data collect: [ :each | each perform: #sqrt ]) withIndex: index copy compartment: self compartment