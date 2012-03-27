as yet unclassified
exampleEyeSee
"self exampleEyeSee"
|diag|
diag := ESDiagramRenderer new.
(diag lineDiagram)
       y: [:x | x*x];
       yAxisLabel: '';
       rotatedLabels: true;
       regularAxis;
       defaultColor: Color red;
       models: (0 to: 10 by: 0.1).
diag open.