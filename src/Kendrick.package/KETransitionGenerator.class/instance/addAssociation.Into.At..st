as yet unclassified 
addAssociation: assoc Into: tr At: elem
	| t from to |
	t := KETransition new.
	from := Dictionary new: tr from keys size + 1.
	to := Dictionary new: tr to keys size + 1.
	from addAll: tr from.
	from add: assoc.
	to addAll: tr to.
	to add: assoc.
	t from: from.
	t to: to.
	t probability: (self pickVariableFrom: tr probability AtIndex: elem).
	^ t