instance creation
open
	"Open the browser on the model collector"
	|collection|
	collection := KEExample models .
	
	self buildBrowser.
	browser openOn: collection. 