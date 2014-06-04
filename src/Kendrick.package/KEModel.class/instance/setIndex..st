accessing
setIndex: index
	|variable|
	variable := equations first variable.
	variable isAnIndexedVariable ifTrue: [ 
		self addTemporalParameter: ((variable atIndex: 1) symbol) value: index
		 ]