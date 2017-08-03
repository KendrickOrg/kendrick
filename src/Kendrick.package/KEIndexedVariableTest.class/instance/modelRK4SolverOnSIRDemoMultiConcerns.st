as yet unclassified 
modelRK4SolverOnSIRDemoMultiConcerns
	"self new modelRK4SolverOnSIRDemoMultiConcerns"
	| model |
	model := KEModel new population: (KEPopulation size: 10000).
	model
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#human #bird))};

		atCompartment:
			{(#status -> #S).
			(#species -> #human)}
			put: 4975;
		atCompartment:
			{(#status -> #I).
			(#species -> #human)}
			put: 25;
		atCompartment:
			{(#status -> #R).
			(#species -> #human)}
			put: 0;
		atCompartment:
			{(#status -> #S).
			(#species -> #bird)}
			put: 4975;
		atCompartment:
			{(#status -> #I).
			(#species -> #bird)}
			put: 25;
		atCompartment:
			{(#status -> #R).
			(#species -> #bird)}
			put: 0;
		atParameter: #i assignValue: (1 to: 2).
	
	^ model