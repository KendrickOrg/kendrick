as yet unclassified 
modelRK4SolverOnSIRDemoMultiConcerns
	"self new modelRK4SolverOnSIRDemoMultiConcerns"
	| model|
        model := KEModel new population: (KEPopulation size: 10000).
	model attributes: { #status->#(S I R). #species->#(human bird) }.

	model atParameter: #gamma assignValue: #(5 1).
		
	model atParameter: #beta assignValue: #(4 4) .

	model atParameter: #mu assignValue: #(1  2).
	
   "model atCompartment: {#status->#S}
             put: #(4975 4975).
   model atCompartment: {#status->#I}
             put: #(25 25).
   model atCompartment: {#status->#R}
             put: #(0 0)."
	model atCompartment: { #status->#S. #species->#human } put: 4975.
	model atCompartment: { #status->#I. #species->#human } put: 25.
	model atCompartment: { #status->#R. #species->#human } put: 0.
			
	model atCompartment: { #status->#S. #species->#bird } put: 4975.
	model atCompartment: { #status->#I. #species->#bird } put: 25.
	model atCompartment: { #status->#R. #species->#bird } put: 0.
			
	model
     atParameter: #i assignValue: (1 to: 2).
	^model.