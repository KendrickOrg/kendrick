as yet unclassified
getListCompartmentSymbol
	| listCompartmentSymbol i |
	listCompartmentSymbol := Array new: compartments size.
	i := 1.
	compartments
		do: [ :each | 
			listCompartmentSymbol at: i put: each status.
			i := i + 1 ].
	^ listCompartmentSymbol