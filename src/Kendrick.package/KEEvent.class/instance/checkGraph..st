accessing
checkGraph: model
	(self hasInterPopInteraction) & (model population graph isNotNil)
	ifTrue: [ 
		^ (model population graph hasWeight: weight)
		 ].
	^ false
	 