CREATE OR REPLACE FUNCTION f(x FLOAT) RETURNS FLOAT LANGUAGE plpython3u AS
$$
	import math
	p = [1, 2, 3, 5, 7, 8]
	h = [4, 4, 4, 2, 2, 3]
	w = [2, 6, 3, 3, 4, 6]
	y = 0.0
	for i in range(0, 6):
		y = y+h[i] * math.exp(-math.pow(((x - p[i]) / 10.0) / (w[i] / 100.0), 2.0))
	return y
$$;

