as yet unclassified
executeEvent: eventChosen in: cityChosen
	model currentSubPopulation: cityChosen.
	(cityChosen events at: eventChosen) executeOn: model

	