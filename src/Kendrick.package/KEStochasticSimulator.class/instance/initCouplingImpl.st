as yet unclassified
initCouplingImpl
	|couplingImpl foundEventImpl|
	couplingImpl := (KERuntimeCouplingEventImpl new) model: model.
	foundEventImpl := false.
	1 to: self rtImpls size do: [ :i| |each|
		each := self rtImpls at: i.
		each class = KERuntimeEventImpl ifTrue: [ 
			self rtImpls at: i put: couplingImpl.
			foundEventImpl := true
			 ]
		 ].
	foundEventImpl ifFalse: [ rtImpls add: couplingImpl ]