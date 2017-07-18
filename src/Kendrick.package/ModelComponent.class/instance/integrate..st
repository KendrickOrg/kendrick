protected
integrate: concern.

	backEndEntity integrate: concern keConcern.
	parameters addAll: concern parameters.
	concern parameters keysAndValuesDo: [ :key :value | self addParameter: key value: value ].
	attributes addAll: concern attributes. "init compartments from concerns not possible just add"
	
