as yet unclassified
concern: arg1
	| tmp1 |
	tmp1 := KendrickModel withId: arg1.
	(concerns includes: tmp1)
		ifFalse: [ tmp1 extends do: [ :arg2 | self concern: arg2 ].
			concerns add: tmp1.
			model integrate: tmp1 ]