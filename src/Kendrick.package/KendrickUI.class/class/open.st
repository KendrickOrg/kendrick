as yet unclassified
open

	^ self 
		inspect: (Smalltalk vmDirectory parent asFileReference / 'KendrickEntities/')
		label: 'KendrickUI'