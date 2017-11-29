action
save: fileName
	"This function will save all data in a file as fileName. The time col is first and next is the data col"
	|stream fileSystem workDir|
	fileSystem := FileSystem disk workingDirectory.
	workDir := fileSystem resolvePath: (fileSystem path / fileName).
	stream := workDir writeStream.
	1 to: (index size) do: [ :i|
		stream nextPutAll: (index at: i) asString, String tab, (data at: i) asString;cr.
		 ].
	stream close