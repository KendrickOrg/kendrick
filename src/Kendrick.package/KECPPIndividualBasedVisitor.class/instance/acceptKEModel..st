as yet unclassified
acceptKEModel: aModelNode
	|working fileName|
	fileName := self getFileName: aModelNode.
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	
	self prepareCPPFile.
	"define some global variables"
	stream nextPutAll: '#define TMAX ',	 aModelNode simulator tMax asString;cr.
	stream nextPutAll: '#define TMIN ', aModelNode simulator tMin asString;cr.
	stream nextPutAll: '#define STEP ', aModelNode simulator step asString;cr.
	