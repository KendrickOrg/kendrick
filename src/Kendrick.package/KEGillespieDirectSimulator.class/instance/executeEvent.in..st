as yet unclassified
executeEvent: eventChosen in: cityChosen
	model currentPopulationID: cityChosen.
	((model population at: cityChosen) events at: eventChosen) executeOn: model

	