public-api
splitStatus: symExpression

	"splitStatus: {  #(I). index->#(1 2) }.
	splitStatus: #(I index #(1 2))"

	|statusCompartment indexes|
	
	statusCompartment := symExpression copyFrom: 1 to: ((symExpression indexOf: #index)-1).
	indexes := symExpression last.

	indexes do: [:index | 
		statusCompartment do: [ :e| 
			(attributes at: #status) 
				add: (e asString , index asString) asSymbol].
	].

	backEndEntity transitions: (self allHierarchyTransitions 
		select: [:tr| (statusCompartment includes: (tr from at: #status)) | (statusCompartment includes: (tr to at: #status)) ]).
	backEndEntity splitStatus: { statusCompartment . symExpression second -> indexes }.