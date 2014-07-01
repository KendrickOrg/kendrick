as yet unclassified
initMovementImpl
	(model population graph hasWeight: #movement) ifTrue: [ 
		|moveImpl|
		moveImpl := (KERuntimeMovementEventImpl new) model: model.
		self rtImpls add: moveImpl
		 ]
	