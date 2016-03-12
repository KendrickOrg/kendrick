accessing
log
	^ self class from: (data collect: [ :each | each perform: #log ]) withIndex: index copy compartment: self compartment