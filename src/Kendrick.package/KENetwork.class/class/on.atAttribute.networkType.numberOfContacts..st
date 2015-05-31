as yet unclassified
on: population atAttribute: attribute networkType: type numberOfContacts: nbCont 
	|network|
	"network := KENetwork new population: population.
	network nodes: OrderedCollection new.
	attribute = #status ifTrue: [ 
		network networkOfIndividuals: true.
		1 to: population individuals size do: [ :i| 
			network nodes add: (KENetworkNode new label: ((population individuals at: i) currentStatus at: #status))
			 ]
		 ] 
	ifFalse: [ 
		network networkOfIndividuals: false.
		((population attributes at: attribute) collect: [:e| Dictionary newFrom: {(attribute->e)}]) do: [ :e| network nodes add: (KENode new label: e) ] ]."
	network := KENetwork on: population atAttribute: attribute.
	network := network buildNetworkType: type numberOfContacts: nbCont.
	population addGraph: network.
	^ network
	
	