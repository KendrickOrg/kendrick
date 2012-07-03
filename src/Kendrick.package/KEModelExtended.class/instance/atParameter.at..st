as yet unclassified
atParameter: aParameter at: index

| x |
x := (parameters at: aParameter ifAbsent: nil).
x isNil ifTrue: [^nil] ifFalse: [^(x at: index)]