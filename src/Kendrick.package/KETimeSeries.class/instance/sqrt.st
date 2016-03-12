accessing
sqrt
	^ self class from: (data collect: [ :each | each perform: #sqrt ]) withIndex: index copy compartment: self compartment