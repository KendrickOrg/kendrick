as yet unclassified
open

	^ self 
		inspect: (Smalltalk vmDirectory parent asFileReference / 'Library/')
		label: 'KendrickUI'