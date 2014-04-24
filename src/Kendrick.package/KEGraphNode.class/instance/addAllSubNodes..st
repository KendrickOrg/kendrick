accessing
addAllSubNodes: anArray
	anArray do: [ :each| self addSubNode: each ]