public-api
compartments
	"Return a set of compartments by doing a cartesian product on status"

	| collection |
	collection := Set new.
	self attributes keysAndValuesDo: [ :k :v | v do: [:i| collection add: (KECompartment from: {(k -> i)}) ] ].
	^ collection