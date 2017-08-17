accessing
transitions
	transitions ifNil: [ 
		transitions := Dictionary new.
		1 to: model transitions size do: [ :i||tr|
			tr := model transitions at: i.
			((tr from at: #status) ~= #empty) ifTrue: [ transitions at: tr from ifAbsentPut: OrderedCollection new.
				(transitions at: tr from) add: (tr->i)
				 ]
			 ]
		 ].
	^ transitions