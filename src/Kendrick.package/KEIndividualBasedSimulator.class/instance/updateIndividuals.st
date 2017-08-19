as yet unclassified
updateIndividuals
	"Update status for individuals of population"

	"We remove individuals whose status are empty"

	| dead additionalTrans |
	dead := model population individuals
		select:
			[ :ind | ind nextStatus isNotNil and: [ (ind nextStatus at: #status) = #empty ] ].
	dead do: [ :ind | model population removeIndividual: ind ].

	"Update individuals state with next status"
	model population individuals
		do: [ :ind | 
			ind nextStatus isNotNil
				ifTrue: [ model population updateIndividual: ind ] ].

	"Update compartments'size"

	
	additionalTrans := self generateMoreTransitions.
	1 to: additionalTrans size do: [ :i | 
		| tr |
		"tr := model transitions at: i."
		tr := additionalTrans at: i.
		tr executeOn: model times: (self transitionNbExecutions at: i).
		self transitionNbExecutions at: i put: 0 ]