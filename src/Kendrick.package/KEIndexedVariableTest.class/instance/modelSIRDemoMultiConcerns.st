models
modelSIRDemoMultiConcerns
	"self new modelSIRDemoMultiConcerns"
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
	model atParameter: #beta assignValue: #(5 4).
	model atParameter: #gamma assignValue: #(5 1).
	^ model