accessing
initializeListColors
	| nbSpecies listColor |
	nbSpecies := (data at: 1) size.
	listColor := Array new: nbSpecies.
	1 to: nbSpecies do:[:i|
		|rd|
		rd := Random new.
		listColor at: i put: (Color r: (rd next) g: (rd next) b: (rd next))].
	^listColor