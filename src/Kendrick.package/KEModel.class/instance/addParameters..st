adding
addParameters: input
	input do: [ :e| self addParameter: e key value: e value ]
	
	