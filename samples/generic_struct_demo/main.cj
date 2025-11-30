/// 泛型结构体
struct Pair<T, U> {
    let x: T
    let y: U
	
    public init(a: T, b: U) {
        x = a
        y = b
    }
	
    public func first(): T {
        return x
    }
	
    public func second(): U {
        return y
    }
}

main() {
    var a: Pair<String, Int64> = Pair<String, Int64>("hello", 0)
	
    println(a.first())
    println(a.second())
}