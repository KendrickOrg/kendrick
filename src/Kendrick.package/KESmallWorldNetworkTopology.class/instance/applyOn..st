accessing
applyOn: graph
	activeNodes := OrderedCollection new.
	1 to: graph nodes size do: [ :i| self appendNode: i->graph ]