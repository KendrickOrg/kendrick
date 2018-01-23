as yet unclassified
entitiesFor: attr 

	"first list entities with attributes, second list entities with values"

	^ { 
	
		(attr collect: [:attribute | 
			((concerns copy add: self model; yourself) 
				select: [ :e | 
					e attributes keys includes: attribute
	 			]
			)  ]) flatten.
			
		(attr collect: [:attribute | 
			((concerns copy add: self model; yourself) 
				select: [ :e | 
					e attributes values first includes: attribute
	 			]
			) ]) flatten.	
			
	}	
