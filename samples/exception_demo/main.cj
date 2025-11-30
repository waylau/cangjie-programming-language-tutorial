/// throw 和处理异常

class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}


main() {
	// 普通try表达式
    try {
        throw NegativeArraySizeException("NegativeArraySizeException")
    } catch (e: NegativeArraySizeException) {
        println("Exception info: ${e}.")
    } finally {
        println("The finally block is executed.")
    }

    // try-with-resources表达式
    try (r = R()) {
        println("Get the resource")
    }
	
	// 类型模式
	try {
        throw IllegalArgumentException("This is an Exception!")
    } catch (e: OverflowException) {
        println(e.message)
        println("OverflowException is caught!")
    } catch (e: IllegalArgumentException | NegativeArraySizeException) {
        println(e.message)
        println("IllegalArgumentException or NegativeArraySizeException is caught!")
    } finally {
        println("finally is executed!")
    }
	
	// 通配符模式
	try {
		throw OverflowException()
	} catch (_) {
		println("catch an exception!")
	}
}
