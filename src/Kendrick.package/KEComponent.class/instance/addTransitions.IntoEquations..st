adding
addTransitions: tr IntoEquations: eq

	(self checkTransition: tr) 
		ifFalse: [ self addMoreTransitionsFrom: tr IntoEquations: eq]
	ifTrue: [  
			(tr to at: #status) = #empty ifTrue:
				[(eq includesKey: (tr from) ) ifTrue:
				  [  (eq at: tr from) add: (Array with: tr with: -1).  ].  ].
			(tr from at: #status) = #empty ifTrue:	
				[  (eq includesKey: (tr to) ) ifTrue:
					[  (eq at: tr to) add: (Array with: tr with: 1).     ].	 ].
			(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]) ifTrue:[ 
				(eq includesKey: (tr from) ) ifTrue:
					[(eq at: tr from) add: (Array with: tr with: -1).	 ].
				(eq includesKey: (tr to) ) ifTrue:
					[(eq at: tr to) add: (Array with: tr with: 1) ].
				].  
			 ].