accessing
integrate: aConcern
	concerns add: aConcern.
	self transitions: (aConcern generateTensorSum: self transitions).
	aConcern attributes keysAndValuesDo: [ :k :v| 
		self addAttribute: k value: v
	].
	aConcern parameters keysAndValuesDo: [ :k :v| 
		self addParameter: k value: v
	].
	self population reset.