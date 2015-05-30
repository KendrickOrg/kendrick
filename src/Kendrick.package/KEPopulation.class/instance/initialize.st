adding
initialize
	super initialize.
	configurations := Dictionary newFrom:{(#mass_action->true). (#rescale->true). (#sizeOfPopulation->#population)}