instance creation
openWith: aRenderer 
	 
	window := GLMMorphicWindowRenderer render: self from: aRenderer.
	^ window openFullscreen.