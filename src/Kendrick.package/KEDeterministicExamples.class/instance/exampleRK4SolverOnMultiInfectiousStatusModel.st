examples
exampleRK4SolverOnMultiInfectiousStatusModel
	"self new exampleRK4SolverOnMultiInfectiousStatusModel"
	|model |
	model := KEModel new.
	model population attributes: {#status->#(S I Is R)}.
	
															
														