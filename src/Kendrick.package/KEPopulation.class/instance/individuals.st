accessing
individuals
	| tmp1 |
	individuals
		ifNil: [ | tmp2 |
			tmp2 := 0.
			individuals := OrderedCollection new.
			self compartments
				keysAndValuesDo: [ :arg1 :arg2 | 
					| tmp3 |
					1 to: arg2 do: [ :tmp4 | 
						tmp3 := nil.
						tmp3 := KEIndividual new.
						tmp2 := tmp2 + 1.
						tmp3
							updateAttributes: arg1;
							currentStatus: arg1;
							id: tmp2.
						individuals add: tmp3 ].
					1 ] ].
	^ individuals