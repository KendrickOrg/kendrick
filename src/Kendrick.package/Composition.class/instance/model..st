as yet unclassified
model: aString

	model := [ModelComponent withId: aString] on: Error do: [ ModelComponent new id: aString]. 
	"the error should be a Comp. DNU here -- fix"
	backEndEntity := model keModel 