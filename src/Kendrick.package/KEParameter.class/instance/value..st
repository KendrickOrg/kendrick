accessing
value: arg1
	| tmp1 tmp3 |
	expression isArray
		ifTrue: [ ^ expression ].
	expression class = Interval
		ifTrue: [ tmp1 := Array new: expression size.
			tmp3 := 1.
			expression
				do: [ :arg2 | 
					tmp1 at: tmp3 put: arg2.
					tmp3 := tmp3 + 1 ].
			^ tmp1 ].
	^ expression value: arg1