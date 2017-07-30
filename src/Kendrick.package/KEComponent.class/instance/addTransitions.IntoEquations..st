adding
addTransitions: tr IntoEquations: eq
	"ThanhNT 28/7/2017"
	
	((eq includesKey: (tr from) ) and: (eq includesKey: (tr to) ))
		ifTrue: [ 
			(eq at: tr from) add: (Array with: tr with: -1).
			(eq at: tr to) add: (Array with: tr with: 1)  ]
		ifFalse: [ 
			eq keysDo: [ 
				:eachKey|
				|kFrom vFrom kTo vTo|
				kFrom := (((tr from) keys) at: 1).
				vFrom := ((tr from) at: kFrom).
				
				kTo := (((tr to) keys) at: 1).
				vTo := ((tr to) at: kTo).
				((eachKey includesKey: kFrom) 
						and: (eachKey values includes: vFrom))
					ifTrue: [ (eq at: eachKey) add: (Array with: tr with: -1)].
				((eachKey includesKey: kTo) 
						and: (eachKey values includes: vTo))
					ifTrue: [ (eq at: eachKey) add: (Array with: tr with: 1)].
				 ]
			
			 ]