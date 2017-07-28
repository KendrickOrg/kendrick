as yet unclassified
entityFilesDir: aProject

	^ (SmalltalkImage current lastImagePath asFileReference parent / ('Sources/Projects/' , aProject , '/'))