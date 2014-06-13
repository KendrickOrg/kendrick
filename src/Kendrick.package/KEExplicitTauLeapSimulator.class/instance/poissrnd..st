as yet unclassified
poissrnd: rate
	|poisson tau num|
	tau := step.
	poisson := PoissonGenerator lambda: (rate * tau).
	num := poisson next.
	^ num
	
	