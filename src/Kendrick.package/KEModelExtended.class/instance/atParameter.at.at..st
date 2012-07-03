as yet unclassified
atParameter: aParameter at: index1 at: index2

| x |
x := (parameters at: aParameter ifAbsent: nil).
x isNil ifTrue: [^nil] ifFalse: [^((x at: index1) at: index2)]
