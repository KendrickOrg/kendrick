as yet unclassified
open

	^ self 
		inspect: (Smalltalk vmDirectory parent asFileReference / 'Sources/')
		label: 'KendrickUI'