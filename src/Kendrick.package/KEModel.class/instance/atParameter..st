as yet unclassified
atParameter: aParameter

"^ parameters at: aParameter ifAbsent:[^nil]"
|x|
x := parameters at: aParameter ifAbsent: [^nil].
x ifNotNil: [
	x expression ifNil: [^(x value)]
	ifNotNil: [
		x evaluateWithModel: self.
		^(x value)
		]
	]