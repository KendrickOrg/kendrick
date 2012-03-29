
!RungeKutta methodsFor: 'as yet unclassified'!
adapt: h0 to: eps from: ty0 
     "One adaptive step of the Runge-Kutta procedure"

 | h H ty1 ty2|
 h := h0 / 2.
 [
  H := 2 * h.
  ty1 := self step: H from: ty0.
  ty2 := self step: H / 2 from: (self step: (H / 2) from: ty0). 
  h := H / (((16 / 15) * ((ty2 space) - (ty1 space)) abs / eps) raisedTo: 1 / 5).
  H / h > 2.
 ] whileTrue.
 ^ ty2! !
