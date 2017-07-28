operators
splitStatus: inputs
   |anArrayOfSymbol key values trans tmp|
	anArrayOfSymbol := inputs first.
	key := inputs second key.
	values := inputs second value.                                                                         	
	anArrayOfSymbol = #all ifTrue: [ ^ self splitStatus: (self atAttribute: #status) ].
	anArrayOfSymbol ifNil: [ ^ self error: 'Concern does not contains status attribute' ].
	
	values do: [ :v| 
		anArrayOfSymbol do: [ :k| 
			self atAttribute: #status add: (k asString, v asString) asSymbol
		]	
	].

	tmp := Dictionary newFrom: (anArrayOfSymbol collect: [ :e|
		e->(values collect: [ :v| (e asString, v asString) asSymbol ])	
	]).
	
	trans := self transitions select: [ :tr| 
		(anArrayOfSymbol includes: (tr from at: #status)) | 
		(anArrayOfSymbol includes: (tr to at: #status)) ].
	
	trans do: [ :tr| |trs|
		trs := OrderedCollection new.
		(anArrayOfSymbol includes: (tr from at: #status))  
		ifTrue: [ 
			(anArrayOfSymbol includes: (tr to at: #status)) ifTrue: [  
				1 to: values size do: [ :i| 
					|newTr|
					newTr := KETransition from: tr from copy to: tr to copy probability: tr probability.
					newTr from at: #status put: ((tmp at: (tr from at: #status)) at: i).
					newTr to at: #status put: ((tmp at: (tr to at: #status)) at: i).
					trans add: newTr
				]
			]
			ifFalse: [  
				trs addAll: ((tmp at: (tr from at: #status)) collect: [ :each| |newTr|
				newTr := KETransition from: tr from copy to: tr to copy probability: tr probability.
				newTr from at: #status put: each.
				newTr ])
			]  
		] 
		ifFalse: [  
			trs addAll: ((tmp at: (tr to at: #status)) collect: [ :each| |newTr|
				newTr := KETransition from: tr from copy to: tr to copy probability: tr probability.
				newTr to at: #status put: each.
				newTr])
		].
		self transitions addAll: trs.
		tr probability: 0.
	]
	