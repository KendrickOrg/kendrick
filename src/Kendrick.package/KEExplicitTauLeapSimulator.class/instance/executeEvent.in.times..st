as yet unclassified
executeEvent: eventChosen in: cityChosen times: times
	model currentPopulationID: cityChosen.
	((model population at: cityChosen) events at: eventChosen) executeOn: model times: times