instance creation
openOn: aPage
	| w |
	w := self 
		openOn: aPage 
		with: self defaultRenderer.
	w extent: self class preferredExtent.
	^ w