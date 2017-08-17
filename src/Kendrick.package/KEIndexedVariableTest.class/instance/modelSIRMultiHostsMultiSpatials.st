as yet unclassified
modelSIRMultiHostsMultiSpatials
|model|
model := KEModel new.
model population: (KEPopulation size: 10000).
model
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#human #bird)).
			(#spatial -> #(#paris #lyon))
			};
		atCompartment:
			{(#status -> #S). 	(#species -> #human).  (#spatial -> #paris) } 	put: 1800;
		atCompartment:
			{(#status -> #S). 	(#species -> #human).  (#spatial -> #lyon) } 	put: 1800;
		atCompartment:
			{(#status -> #S). 	(#species -> #bird).  (#spatial -> #paris) } 	put: 1800;
		atCompartment:
			{(#status -> #S). 	(#species -> #bird).  (#spatial -> #lyon) } 	put: 1800;
					
		atCompartment:
			{(#status -> #I). 	(#species -> #human).  (#spatial -> #paris) } 	put: 500;
		atCompartment:
			{(#status -> #I). 	(#species -> #human).  (#spatial -> #lyon) } 	put: 500;
		atCompartment:
			{(#status -> #I). 	(#species -> #bird).  (#spatial -> #paris) } 	put: 500;
		atCompartment:
			{(#status -> #I). 	(#species -> #bird).  (#spatial -> #lyon) } 	put: 500;
					
		atCompartment:
			{(#status -> #R). 	(#species -> #human).  (#spatial -> #paris) } 	put: 200;
		atCompartment:
			{(#status -> #R). 	(#species -> #human).  (#spatial -> #lyon) } 	put: 200;
		atCompartment:
			{(#status -> #R). 	(#species -> #bird).  (#spatial -> #paris) } 	put: 200;
		atCompartment:
			{(#status -> #R). 	(#species -> #bird).  (#spatial -> #lyon) } 	put: 200.
	model addParameter: #i value: 1.
	model addParameter: #j value: 2.
^model