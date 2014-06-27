as yet unclassified
performEventImpl
	|eventImpl|
	eventImpl := (KERuntimeEventImpl new) model: model.
	self rtImpls add: eventImpl