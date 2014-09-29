as yet unclassified
initContacts
	nodes do: [ :each|
		each adjacentNodes do: [ :ajNodeID|
			each at: ((population indList at: ajNodeID) currentStatus) add: 1
			 ]
		 ]
	