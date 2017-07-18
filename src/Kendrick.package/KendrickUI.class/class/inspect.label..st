openning
inspect: anObject label: aString

	| instance |
	instance := self new.
	(instance 
		title: aString;
		openOn: anObject) fullscreen.
	^ instance