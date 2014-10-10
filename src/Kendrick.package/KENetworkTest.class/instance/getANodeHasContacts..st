tests
getANodeHasContacts: graph
	1 to: graph nodes size do: [ :i| (graph nodes at: i) adjacentNodes size > 0 ifTrue: [ ^ i ] ].
	^ -1