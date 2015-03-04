as yet unclassified
isInfected
	^ (self isAlive and: [ (self currentStatus at: #status) = #I ] )