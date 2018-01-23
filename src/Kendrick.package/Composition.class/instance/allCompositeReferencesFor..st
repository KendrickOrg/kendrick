as yet unclassified
allCompositeReferencesFor: variablePlusAttributes

	| compartment compResults|
	compartment := variablePlusAttributes first.	
	attributes := variablePlusAttributes allButFirst 
						collect: [ :attribute |  
							((concerns copy add: (self model); yourself) 
								select: [ :e | e attributes keys includes: (attribute)]) first attributes associationAt: attribute ].
	
	compResults := {{ self referencesFor: compartment } asOrderedCollection } asOrderedCollection.
	
	attributes do: [ :attribute | 
		|newCompResults|
		newCompResults := OrderedCollection new.
		compResults do: [ :resultList | 
			attribute value do: [ :value |
					newCompResults add: (resultList copy add: attribute key -> value; yourself).
			]
		].
		compResults := newCompResults.
	].
	
	
	^ compResults collect: [ :res | res asArray ]
	