as yet unclassified
executeEvent: events arg: arguments
	model setPopulationID: (arguments at: #cityChosen).
	(events at: (arguments at: #eventChosen)) executeOn: model.
	^ (arguments at: #eventChosen)