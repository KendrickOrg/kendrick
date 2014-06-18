as yet unclassified
atCompartment: aStatus

compartments do: [:each|
	each status = aStatus ifTrue:[^each]
	].
^nil
	
