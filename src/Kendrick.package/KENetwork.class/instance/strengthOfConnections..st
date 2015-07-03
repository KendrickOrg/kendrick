as yet unclassified
strengthOfConnections: anArrayOfValues
	"(self edges size = 0) ifTrue: [ ^ self error: 'Network contains no edges' ].
	1 to: self edges size do: [ :i|
		self with: (self edges at: i) strengthOfConnection: (anArrayOfValues at: i) ]"
	self strengthOfConnections: anArrayOfValues oneWay: false