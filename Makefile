adder: adder.t
	./adder.t

adder.t: adder.t.v adder.v
	iverilog -o adder.t adder.t.v
