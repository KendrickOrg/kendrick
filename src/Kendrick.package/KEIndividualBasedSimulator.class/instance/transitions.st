accessing
transitions
	| additionalTrans |
	transitions
		ifNil: [ transitions := Dictionary new.
			additionalTrans := OrderedCollection new.
			1 to: model transitions size do: [ :i | 
				| tr |
				tr := model transitions at: i.
				(model checkTransition: tr)
					ifTrue: [ additionalTrans add: tr ]
					ifFalse: [ additionalTrans addAll: (model createMoreTransitions: tr) ] ].
			1 to: additionalTrans size do: [ :i | 
				| tr |
				tr := additionalTrans at: i.
				(tr from at: #status) ~= #empty
					ifTrue: [ transitions at: tr from ifAbsentPut: OrderedCollection new.
						(transitions at: tr from) add: tr -> i ] ] ].
	^ transitions