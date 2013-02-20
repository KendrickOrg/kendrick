as yet unclassified
atParameter: aParameter at: index

| x |
x := (parameters at: aParameter ifAbsent: nil).
x isNil ifTrue: [^nil] ifFalse: [
	(x expression) ifNil: [^((x value) at: index)]
	ifNotNil: [
		x evaluateWithModel: self.
		"^((x value) at: index)"
		^ (x value).
		]
	]