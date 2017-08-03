adding
addTransitions: tr IntoEquations: eq
	"ThanhNT 28/7/2017"
	
	((eq includesKey: (tr from) ) and: (eq includesKey: (tr to) ))
		ifTrue: [ 
			(tr to at: #status) = #empty ifTrue:
				[  (eq at: tr from) add: (Array with: tr with: -1).  ].
			(tr from at: #status) = #empty ifTrue:	
				[  (eq at: tr to) add: (Array with: tr with: 1).     ].
			(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]) ifTrue:[ 
				(eq at: tr from) add: (Array with: tr with: -1).
				(eq at: tr to) add: (Array with: tr with: 1)
				].  
				]
		ifFalse: [ 
			eq keysDo: [ 
				:eachKey|
				|kFrom vFrom kTo vTo cond1 cond2|
				kFrom := (((tr from) keys) at: 1).
				vFrom := ((tr from) at: kFrom).
				
				kTo := (((tr to) keys) at: 1).
				vTo := ((tr to) at: kTo).
				
				cond1 := ((tr to at: #status) = #empty) or: 
								(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]).

				cond2 := ((tr from at: #status) = #empty) or: 
								(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]).
												
				((eachKey includesKey: kFrom) 
						and: (eachKey values includes: vFrom))
					ifTrue: [ 
						cond1 ifTrue: 
							[(eq at: eachKey) add: (Array with: tr with: -1)]
						].
				((eachKey includesKey: kTo) 
						and: (eachKey values includes: vTo))
					ifTrue: [ 
						cond2 ifTrue:
							[(eq at: eachKey) add: (Array with: tr with: 1)]
						].
				 ]
			
			 ]