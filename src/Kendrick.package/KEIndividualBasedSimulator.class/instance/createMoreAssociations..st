private
createMoreAssociations: as
	|additionalAs species|
	species := model attributes at: #species.
	additionalAs := OrderedCollection new.
	1 to: (species size) do: [ 
		:each|
		|t from to a val| 
		t := KETransition new.
		from := Dictionary new: 2.
		to := Dictionary new: 2.
		from add: ((as key from) associationAt: #status).
		from at: #species put: (species at: each).
		
		to add: ((as key to) associationAt: #status).
		to at: #species put: (species at: each).	
		
		t from: from.
		t to: to.
		val := each - 1 + as value.
		t probability: as key probability.
		a := t -> val.
		additionalAs add: a.
		 ].
	^additionalAs.