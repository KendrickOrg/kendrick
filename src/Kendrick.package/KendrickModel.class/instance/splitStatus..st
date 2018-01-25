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
	backEndEntity transitions: self allHierarchyTransitions. 
	backEndEntity splitStatus: { statusCompartment . symExpression second -> indexes }.