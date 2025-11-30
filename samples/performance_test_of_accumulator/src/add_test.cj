package performance_test_of_accumulator

import std.time.*

@Test
func addTest() {
	let start = MonoTime.now()

	var result = 0;
	for (i in 1..1000001) {
		result = add(result, i);
	}

	let end = MonoTime.now();
	let cost = end - start;
	println("result: ${result} , cost ${cost.toNanoseconds()} ns"); // 单位：ns
}