as yet unclassified
open
	"Open the browser on the model collector"
	|collection|
	collection := KEExamples models.
	
	self buildBrowser.
	browser openOn: collection. 