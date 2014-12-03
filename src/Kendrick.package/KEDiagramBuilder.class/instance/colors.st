as yet unclassified
colors
	"Return two colors in the case of having at most two elements in data set"
	|c|
	c := Array new: 2.
	c at: 1 put: (Color r: 0.894 g: 0.102 b: 0.109 alpha: 1.0).
	c at: 2 put: (Color r: 0.216 g: 0.494 b: 0.721 alpha: 1.0).
	^ c