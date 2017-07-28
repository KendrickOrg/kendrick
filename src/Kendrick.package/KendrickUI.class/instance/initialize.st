as yet unclassified
initialize

	super initialize.
	
	self presentationFilter: (GTInspectorTagFilter new
			defaultTag: nil;
			addAndSelectTag: #kendrick).
