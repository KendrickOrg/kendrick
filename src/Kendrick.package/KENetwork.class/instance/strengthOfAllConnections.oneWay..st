as yet unclassified
strengthOfAllConnections: aSingleValue oneWay: flag
	((self edges size = 0) and: [topology isNil]) ifTrue: [ ^ self error: 'Network contains no edges' ].
	(self edges size > 0) ifTrue: [  
		1 to: self edges size do: [ :i|
			self with: (self edges at: i) strengthOfConnection: aSingleValue oneWay: flag	
			]
		]
	ifFalse: [ 
		topology strengthOfConnection: aSingleValue oneWay: flag.
		topology applyOn: self
		]
	