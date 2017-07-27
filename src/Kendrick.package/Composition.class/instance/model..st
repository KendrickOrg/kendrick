as yet unclassified
model: arg1
	model := [ ModelComponent withId: arg1 ]
		on: Error
		do: [ ModelComponent new id: arg1 ].
	backEndEntity := model keModel