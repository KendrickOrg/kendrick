as yet unclassified
initContacts
	nodes do: [ :each|
		each adjacentNodes keysDo: [ :ajNodeID|
			each atContact: ((population individuals at: ajNodeID) currentStatus at: #status) add: 1
			 ]
		 ].
	1 to: nodes size do: [ :i| [(population individuals at: i) attributes at: #infectedContacts put: ((nodes at: i) atContact: #I) ] ]
	