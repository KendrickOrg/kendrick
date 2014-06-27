as yet unclassified
executeMovementEvent: events arg: arguments
	model setPID: (arguments at: #cityChosen).
	((events at: (arguments at: #cityChosen)) at: (arguments at: #eventChosen)) executeOn: model.
	^ (arguments at: #eventChosen)