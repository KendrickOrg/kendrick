as yet unclassified
models
   |models deterministic methods|   
	models := OrderedCollection new.
	deterministic := KEDeterministicExamples new.
	methods := (KEDeterministicExamples selectors 
			select: [ :symbol | (symbol beginsWith: 'model') ]).
	methods do:[ :m | models add:(deterministic perform: m) ].
	
	^ models