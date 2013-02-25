as yet unclassified
atIndex: anElement

|id|
	id := index indexOf: anElement ifAbsent: nil.
	id isNil ifTrue: [^nil] ifFalse: [^ self at: id]
	