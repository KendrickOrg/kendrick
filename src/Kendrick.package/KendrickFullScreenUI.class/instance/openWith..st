instance creation
openWith: arg1
	window := GLMMorphicWindowRenderer render: self from: arg1.
	^ window openFullscreen