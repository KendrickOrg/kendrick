
!RungeKutta methodsFor: 'as yet unclassified'!
step: h from: ty0 
     "One step of the Runge-Kutta procedure"

 | y0d yad ybd ycd |
 y0d := ty0 sendTo: b.
 yad := (ty0 add: (TimeSpace time: h / 2 space: h / 2 * y0d)) sendTo: b.
 ybd := (ty0 add: (TimeSpace time: h / 2 space: h / 2 * yad)) sendTo: b.
 ycd := (ty0 add: (TimeSpace time: h space: h * ybd)) sendTo: b.
 ^ ty0 add: (TimeSpace time: h space: h / 6 * (y0d + (2 * (yad + ybd)) + ycd))! !
