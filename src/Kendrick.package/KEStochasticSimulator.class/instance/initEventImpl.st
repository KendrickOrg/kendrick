as yet unclassified
initEventImpl
	|eventImpl|
	eventImpl := (KERuntimeEventImpl new) model: model.
	self rtImpls add: eventImpl