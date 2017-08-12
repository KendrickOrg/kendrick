private
fromNumber: aNumber to: anArray
	"Created by ThanhNT 26/7/17"
	|tmp|
	anArray isArray ifTrue: [ 
		tmp := 0.
		anArray do: [ 
			:each| 
			tmp := tmp + 1.
			each isNumber ifTrue: [ anArray at: tmp put: aNumber   ]. 
			each isArray	  ifTrue: [ self fromNumber: aNumber  to: each ]		
			]
		 ].