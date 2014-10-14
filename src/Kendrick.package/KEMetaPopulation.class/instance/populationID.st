accessing
populationID
	"<MSEProperty: #populationID type: #Collection>"
	populationID ifNil: [ populationID := 0 ].
	^ populationID