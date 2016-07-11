as yet unclassified
contactsOf: arguments
	|model node attributes args|
	model := arguments first.
	attributes := Dictionary newFrom: (arguments copyFrom: 2 to: arguments size).
	node := attributes at: #node.
	attributes removeKey: #node.
	args := OrderedCollection new.
	args add: model.
	args addAll: attributes associations.
	^ (self atNode: node) contactsOf: args