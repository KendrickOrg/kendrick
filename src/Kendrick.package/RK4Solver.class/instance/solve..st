as yet unclassified
solve: aModel
	|size timeSeries|
	aModel PIDList: aModel population getPIDList.
	size := (aModel equations size) * (aModel PIDList size).
	self initializeRK4: size.
	timeSeries := Array new: (self nbOfIterations).
	self initializeData: aModel.
	self initializeY: aModel.
	1 to: (self nbOfIterations) do: [ :j|
		aModel addTemporalParameter: #t value: (x0 + (j * step)).
		timeSeries at: j put: (x0 + (j*step)).
		k1 := self calculateK: aModel.
		self updateValue: k1 to: aModel.
		k2 := self calculateK: aModel.
		self updateValue: k2 to: aModel.
		k3 := self calculateK: aModel.
		self updateValue: (k3 collect: [:each| each*2]) to: aModel.
		k4 := self calculateK: aModel.
		self updateY.
		self updateValue: y to: aModel.
		self updateDataAt: j.
		 ].
	^ self createSimulationResult: aModel withTimeSeries: timeSeries
	