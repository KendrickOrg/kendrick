as yet unclassified
testEquation

self parse:'S:t = -beta * S * I' rule:#equation.
self parse:'I:t = beta * S * I - gamma * I' rule:#equation.
self parse:'R:t = gamma * I' rule:#equation.