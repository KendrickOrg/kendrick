as yet unclassified
expand: arg1 forLists: arg2
	| tmp1 |
	^ arg2 isEmpty
		ifTrue: [ Array with: arg1 ]
		ifFalse: [ tmp1 := arg2 allButFirst: 1.
			arg2 first
				inject: #()
				into: [ :arg3 :arg4 | arg3 , (self expand: (arg1 copyWith: arg4) forLists: tmp1) ] ]