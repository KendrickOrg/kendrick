tests-as yet unclassified
testGenerateSum
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: KEPopulation new.
	tmp1
		integrate: self sirConcern;
		integrate: self multiHostConcern.
	tmp2 := KEModelPart dependOn: self sirConcern.
	tmp2
		atAttribute: #status add: #E;
		removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)};
		addTransitionFrom: {(#status -> #S)}
			to: {(#status -> #E)}
			probability: [ :arg1 | arg1 atParameter: #lambda ];
		addTransitionFrom: {(#status -> #E)}
			to: {(#status -> #I)}
			probability: [ :arg2 | arg2 atParameter: #epsilon ];
		addTransitionFrom: {(#status -> #E)}
			to: #empty
			probability: [ :arg3 | arg3 atParameter: #mu ];
		addParameter: #epsilon.
	tmp3 := tmp2 project: tmp1 transitions.
	self assert: (tmp2 generateSum: tmp3) size equals: 8