as yet unclassified
initMovementImpl
	(model population atParameter: #movement) ifNotNil: [ 
		|moveImpl|
		moveImpl := (KERuntimeMovementEventImpl new) model: model.
		self rtImpls add: moveImpl
		 ]
	