openning
splashLogo
	| logoMorph logoPath |
	logoPath := SmalltalkImage current lastImagePath asFileReference
		parent / '.res/kendrickLogo.png'.
	logoMorph := (ImageReadWriter formFromStream: logoPath readStream)
		asMorph.
	logoMorph openCenteredInWorld.
	[ (Delay forSeconds: 3) wait.
	logoMorph delete ] fork
	"show logo for 3 seconds, while loading the UI in parallel"