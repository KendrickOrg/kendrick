as yet unclassified
compartmentNames
	"Returns compartment names of a model (an array of dictionnaries)"

	|names expand keys|
	"Extract status from attributes"
	names := OrderedCollection new.
	self attributes keysDo: [ :e| 
		names add: ((self atAttribute: e) collect: [ :v| (e->v) ])
	].

	"Do a cartesian product of status"

"names ifEmpty: [ ^Array new].
^(names any collect: [ :n| 
	(Dictionary new) add:n; yourself.
	]) asArray.
"
	expand := [ :prefix :list| 
		list isEmpty
		ifTrue: [ Array with: prefix ]
		ifFalse: [ |tail|
			tail := list allButFirst: 1.
			list first inject: #() into: [ :all :each|
				all, (expand value: (prefix copyWith: each) value: tail) ] ] ].
	keys := expand value: #() value: names.
	keys = #(#()) ifTrue: [ keys := #() ].
	^ (keys collect: [ :e| Dictionary newFrom: e ])
