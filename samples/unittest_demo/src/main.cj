package unittest_demo

func add(left: Int64, right: Int64) {
    return left + right
}

main(): Int64 {
	let add_result = add(21, 34)
	
    println("add_result: ${add_result}")
	
    return 0
}