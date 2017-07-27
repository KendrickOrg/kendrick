openning
splashLogo
	| tmp1 tmp2 |
	tmp2 := SmalltalkImage current lastImagePath asFileReference parent
		/ '.res/kendrickLogo.png'.
	tmp1 := (ImageReadWriter formFromStream: tmp2 readStream) asMorph.
	tmp1 openCenteredInWorld.
	[ (Delay forSeconds: 3) wait.
	tmp1 delete ] fork