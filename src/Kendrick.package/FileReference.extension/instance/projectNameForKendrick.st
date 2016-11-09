*Kendrick-InternalDSL-DSL
projectNameForKendrick

	
	^ self parent basename = 'Projects'
		ifTrue: [ self basename ]
		ifFalse: [ self parent projectNameForKendrick ] 
	