*Kendrick-InternalDSL-DSL
projectNameForKendrick

	"not in Projects"
	({'Library' . 'Scripts'} includes: self parent basename) ifTrue: [ ^ self parent basename ].
		
	^ self parent basename = 'Projects'
		ifTrue: [ self basename ]
		ifFalse: [   
			self parent projectNameForKendrick 
		] 
	