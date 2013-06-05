tests
testStart

self parse:'S:t = -beta * S * I' rule:#start.
self parse:' S:t = -beta * S * I' rule:#start.
self parse:'I:t = beta * S * I - gamma * I' rule:#start.
self parse:'R:t = gamma * I' rule:#start