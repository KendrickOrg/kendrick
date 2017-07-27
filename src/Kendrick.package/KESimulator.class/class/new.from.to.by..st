instance creation
new: arg1 from: arg2 to: arg3 by: arg4
	(self deterministicSolvers keys includes: arg1)
		ifTrue: [ | tmp2 |
			tmp2 := KEDeterministicSimulator new.
			tmp2
				tMin: arg2;
				tMax: arg3;
				step: arg4.
			^ tmp2 solver: (self deterministicSolvers at: arg1) ].
	arg1 = #Gillespie
		ifTrue: [ | tmp4 |
			tmp4 := KEGillespieSimulator new.
			tmp4
				tMin: arg2;
				tMax: arg3.
			^ tmp4 step: arg4 ].
	arg1 = #TauLeap
		ifTrue: [ | tmp6 |
			tmp6 := KETauLeapSimulator new.
			tmp6
				tMin: arg2;
				tMax: arg3.
			^ tmp6 step: arg4 ].
	arg1 = #IBM
		ifTrue: [ | tmp8 |
			tmp8 := KEIndividualBasedSimulator new.
			tmp8
				tMin: arg2;
				tMax: arg3.
			^ tmp8 step: arg4 ]