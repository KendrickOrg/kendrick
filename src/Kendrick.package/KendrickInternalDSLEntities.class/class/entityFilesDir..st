as yet unclassified
entityFilesDir: arg1
	^ SmalltalkImage current lastImagePath asFileReference parent
		/ ('Sources/Projects/' , arg1 , '/')