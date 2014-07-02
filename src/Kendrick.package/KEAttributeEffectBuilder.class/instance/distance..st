as yet unclassified
distance: attribute
	|model pop ind r|
	model := self arguments at: #model.
	pop := model population at: (model getPID).
	ind := pop indList at: (model temporalParameters at: #ind).
	r := 0.
	pop hasGraph 
	ifTrue: [ 
		(pop graph nodes at: (ind id)) adjacentNodes do: [ :each| 
			|d|
			d := ind distanceTo: (pop indList at: each).
			r := r + (attribute effect value: d)
			]
		 ]
	ifFalse: [ 
		pop indList do: [ :each|
			each id ~= ind id 
			ifTrue: [ |d| 
				d := ind distanceTo: (pop indList at: each).
				r := r + (attribute effect value: d) ] ]
		 ].
	^ r