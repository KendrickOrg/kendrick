protected
atCompartment: variable value: value

	|assoc|

	assoc := (attributes associations select: [ :as | as value includes: variable ]) first.
	backEndEntity atCompartment: {assoc key -> variable} put: value
	