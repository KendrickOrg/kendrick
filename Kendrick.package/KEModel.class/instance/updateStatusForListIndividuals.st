as yet unclassified
updateStatusForListIndividuals

listOfIndividuals do: [:each|
	each currentStatus: (each nextStatus).
	each nextStatus: nil.
	].
