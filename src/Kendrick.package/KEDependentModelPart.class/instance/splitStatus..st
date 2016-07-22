operators
splitStatus: inputs
   |anArrayOfSymbol key newStatus trans tmp|
	anArrayOfSymbol := inputs first.
	key := inputs second key.
	newStatus := inputs second value.  
	                                                                       	
	anArrayOfSymbol = #all ifTrue: [ ^ self splitStatus: (self atAttribute: #status) ].
	anArrayOfSymbol ifNil: [ ^ self error: 'Concern does not contains status attribute' ].
	
	newStatus do: [ :v| 
		anArrayOfSymbol do: [ :k| 
			self atAttribute: #status add: (k asString, v asString) asSymbol
		]	
	].

	tmp := Dictionary newFrom: (anArrayOfSymbol collect: [ :e|
		e->(newStatus collect: [ :v| (e asString, v asString) asSymbol ])	
	]).
	
	trans := self transitions select: [ :tr| 
		(anArrayOfSymbol includes: (tr from at: #status)) | 
		(anArrayOfSymbol includes: (tr to at: #status)) ].
	
	trans isEmpty ifTrue: [ ^ self error: 'There are no transitions to do split' ].
	
	trans do: [ :tr| |trs|
		trs := OrderedCollection new.
		(anArrayOfSymbol includes: (tr from at: #status))  
		ifTrue: [ 
			(anArrayOfSymbol includes: (tr to at: #status)) ifTrue: [  
				1 to: newStatus size do: [ :i| 
					|newTr|
					newTr := KETransition from: tr from copy to: tr to copy probability: tr probability.
					newTr from at: #status put: ((tmp at: (tr from at: #status)) at: i).
					newTr to at: #status put: ((tmp at: (tr to at: #status)) at: i).
					trs add: newTr
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
	