as yet unclassified
selectIndividualsIn: list have: status

|individuals|

individuals := Bag new.
list do:[:each|
	(each currentStatus = status) ifTrue: [individuals add: each]
	].
^individuals