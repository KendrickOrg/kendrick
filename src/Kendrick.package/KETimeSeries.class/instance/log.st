accessing
log
	^ KETimeSeries from: (data collect: [ :each | each perform: #log ]) withIndex: index copy compartment: self compartment