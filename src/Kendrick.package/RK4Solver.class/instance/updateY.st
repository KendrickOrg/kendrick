as yet unclassified
updateY
	1 to: (y size) do: [ :i| |oldY|
		oldY := y at: i.
		y at: i put: (((k1 at: i)/6) + ((k2 at: i)/3) + ((k3 at: i)/3) + ((k4 at: i)/6) + oldY)
		 ]