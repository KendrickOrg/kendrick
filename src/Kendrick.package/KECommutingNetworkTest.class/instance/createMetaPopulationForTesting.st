as yet unclassified
createMetaPopulationForTesting
	|population|
	population := KEMetaPopulation new.
	population attributes: { #status->#(S I). #patch->(1 to: 5) }.
	population compartments: '{
		{ #status: #S, #patch: 1 }: 800,
		{ #status: #I, #patch: 1 }: 200,
		{ #status: #S, #patch: 2 }: 1000,
		{ #status: #I, #patch: 2 }: 0,
		{ #status: #S, #patch: 3 }: 1000,
		{ #status: #I, #patch: 3 }: 0,
		{ #status: #S, #patch: 4 }: 1000,
		{ #status: #I, #patch: 4 }: 0,
		{ #status: #S, #patch: 5 }: 1000,
		{ #status: #I, #patch: 5 }: 0
	}'.
	population configurations: { #sizeOfPopulation->#patch. #rescale->false }.
	^ population
	