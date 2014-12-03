as yet unclassified
on: population atAttribute: attribute immigrationCoefficient: beta betweenClasses: arrayOfAssoc
	|graph|
	graph := KEImmigrationGraph new.
	graph nodes: ((population attributes at: attribute) collect: [:e| Dictionary newFrom: (attribute->e)]).
	graph edges: (arrayOfAssoc->attribute) weight: beta 
			values: (arrayOfAssoc collect: [:e| e value]).
	^ graph
	