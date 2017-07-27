instance creation
open
	^ self
		inspect:
			SmalltalkImage current lastImagePath asFileReference parent
				/ 'Sources/'
		label: 'KendrickUI'