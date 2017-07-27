as yet unclassified
atParameter: arg1
	| tmp1 |
	tmp1 := self parameters at: arg1 ifAbsent: [  ].
	tmp1 ifNotNil: [ ^ tmp1 value: self ].
	^ nil