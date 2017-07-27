accessing
transitions
	| tmp1 tmp2 tmp3 |
	transitions
		ifNil: [ transitions := Dictionary new.
			tmp1 := model transitions size.
			tmp3 := tmp1.
			1 to: tmp3 do: [ :tmp4 | 
				tmp2 := nil.
				tmp2 := model transitions at: tmp4.
				(tmp2 from at: #status) ~= #empty
					ifTrue: [ transitions at: tmp2 from ifAbsentPut: OrderedCollection new.
						(transitions at: tmp2 from) add: tmp2 -> tmp4 ] ] ].
	^ transitions