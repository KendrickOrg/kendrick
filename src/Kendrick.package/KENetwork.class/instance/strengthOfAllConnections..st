as yet unclassified
strengthOfAllConnections: aSingleValue
	"((self edges size = 0) and: [topology isNil]) ifTrue: [ ^ self error: 'Network contains no edges' ].
	(self edges size > 0) ifTrue: [  
		1 to: self edges size do: [ :i|
			self with: (self edges at: i) strengthOfConnection: aSingleValue 	
			]
		]
	ifFalse: [ 
		topology strengthOfConnection: aSingleValue.
		topology applyOn: self
		]"
	self strengthOfAllConnections: aSingleValue oneWay: false
	