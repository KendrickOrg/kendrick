as yet unclassified
executeEvent: eventChosen in: pop times: times
	model currentSubPopulation: pop.
	(pop events at: eventChosen) executeOn: model times: times