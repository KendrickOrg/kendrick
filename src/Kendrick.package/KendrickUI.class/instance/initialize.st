as yet unclassified
initialize
	| tmp2 |
	super initialize.
	tmp2 := GTInspectorTagFilter new.
	tmp2 defaultTag: nil.
	self presentationFilter: (tmp2 addAndSelectTag: #kendrick)