as yet unclassified
selectIndividualsIn: list haveStatus: status withSpecieID: specieID

	|individuals|
	individuals := Bag new.
	list do:[:each|
		((each currentStatus = status)&(each specieID = specieID)) ifTrue: [individuals add: each]
		].
	^ individuals