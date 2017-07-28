as yet unclassified
testScript
	self class = TestsIST ifTrue: [ self skip ]. "abstract class with concrete test..."
	"need smth stronger here like the before/after tests on TestsMultiSpecies etc"
	self script.
	(Visualization withId: self vizId) open.