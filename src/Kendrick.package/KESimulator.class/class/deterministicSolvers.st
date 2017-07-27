as yet unclassified
deterministicSolvers
	| tmp1 |
	tmp1 := Dictionary new.
	tmp1
		at: #AB2 put: #AB2Stepper;
		at: #AB3 put: #AB3Stepper;
		at: #AB4 put: #AB4Stepper;
		at: #AM3 put: #AM3Stepper;
		at: #AM4 put: #AM4Stepper;
		at: #BDF2 put: #BDF2Stepper;
		at: #BDF3 put: #BDF3Stepper;
		at: #BDF4 put: #BDF4Stepper;
		at: #BeckwardEuler put: #ImplicitStepper;
		at: #Euler put: #ExplicitStepper;
		at: #Heun put: #HeunStepper;
		at: #ImplicitMidPoint put: #ImplicitMidpointStepper;
		at: #Midpoint put: #MidpointStepper;
		at: #RungeKutta put: #RungeKuttaStepper;
		at: #Trapezoid put: #TrapezoidStepper.
	^ tmp1