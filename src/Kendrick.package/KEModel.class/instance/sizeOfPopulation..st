accessing
sizeOfPopulation: arg1
	| tmp1 |
	tmp1 := OrderedCollection new.
	arg1 isArray
		ifTrue: [ tmp1 addAll: arg1 ]
		ifFalse: [ tmp1 add: arg1 ].
	^ self population sizeOfPopulation: tmp1