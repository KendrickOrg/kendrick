as yet unclassified
updateIndividuals
	"Update status for individuals of population"
	model population individuals do: [ :ind| 
		( ind nextStatus isNotNil ) 
		ifTrue: [ 
			((ind nextStatus at: #status) = #empty) 
			ifTrue: [ model population removeIndividual: ind ] 
			ifFalse: [ 
				model population updateIndividual: ind ]
			 ]
		].
	"Update compartments'size"

	1 to: model transitions size do: [ :i|
		|tr|
		tr := model transitions at: i.
		tr executeOn: model times: (self transitionNbExecutions at: i).
		self transitionNbExecutions at: i put: 0
		 ]
	