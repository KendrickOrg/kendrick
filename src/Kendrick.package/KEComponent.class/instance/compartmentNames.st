public-api
compartmentNames
	"Returns compartment names of a model (an array of dictionnaries)"
	"Should returns a collection of KECompartments in the future"
	
	|names keys|

	"Extract status from attributes"
	names := OrderedCollection new.
	self attributes keysDo: [ :e| 
		names add: ((self atAttribute: e) collect: [ :v| (e->v) ])
	].

	"Do a cartesian product of status"
	keys := self crossProduct: names.
	
	keys = #(#()) ifTrue: [ keys := #() ].
	^ (keys collect: [ :e| Dictionary newFrom: e ])