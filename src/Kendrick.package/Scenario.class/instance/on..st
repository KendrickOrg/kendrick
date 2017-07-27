as yet unclassified
on: arg1
	composition := Composition withId: arg1.
	model := composition model.
	backEndEntity := model keModel.
	compartments := composition compartments.
	concerns := composition concerns