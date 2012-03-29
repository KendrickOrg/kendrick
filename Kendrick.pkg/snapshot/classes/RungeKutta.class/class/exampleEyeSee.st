
!RungeKutta class methodsFor: 'as yet unclassified'!
exampleEyeSee
"self exampleEyeSee"
|diag|
diag := ESDiagramRenderer new.
(diag lineDiagram)
       y: [:x | x*x];
       yAxisLabel: 'X^2';
       rotatedLabels: true;
       regularAxis;
	xAxisLabel:'X';
       defaultColor: Color green;
       models: (0 to: 10 by: 0.1).
diag open.! !
