import std.collection.*

/// HashMap
main() {
    /// 初始化HashMap
    // 创建了一个空的HashMap，其元素类型为String
    let a = HashMap<String, String>()

    //创建了一个元素类型为String的HashMap，并分配了容量100
    let b = HashMap<String, String>(100)

    // 创建了一个元素类型为Int64的HashMap，包含元素0、1、2
    let c = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])

    // 使用另一个集合初始化HashMap
    let d = HashMap<String, Int64>(c)

    // 创建了一个元素类型为String、大小为2的HashMap。
    // 所有元素都由指定的规则函数初始化
    let e = HashMap<Int64, Int64>(2, {x: Int64 => (x, x * x)})

    /// 访问HashMap
    // 使用 for-in 循环遍历 HashMap 的所有元素
    let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    for ((k, v) in map) {
        println("The key is ${k}, the value is ${v}")
    }

    // 按照key访问
    let element = map["a"]
    println("element: ${element}")

    // 使用 size 属性获得对应信息
    let map2 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    if (map2.size == 0) {
        println("This is an empty HashMap")
    } else {
        println("The size of HashMaps is ${map2.size}")
    }

    // 判断某个元素是否被包含在某个 HashMap 中
    let map3 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let b1 = map3.contains("a")
    let b2 = map3.contains("d")
    println("b1: ${b1}, b2: ${b2}")

    /// 修改HashMap
    // 对某个键对应的值进行修改
    let map4 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    map4["a"] = 3
    for ((k, v) in map4) {
        println("The key is ${k}, the value is ${v}")
    }

    // 同一个HashMap实例的所有引用都会共享同样的数据
    let map5 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let map6 = map5
    map6["a"] = 3

    let element2 = map5["a"]
    println("element: ${element2}")

    // 添加到 HashMap 的末尾
    let map7 = HashMap<String, Int64>()
    map7.put("a", 0)
    map7.put("b", 1)
    let arr1 = [("c", 2), ("d", 3)]
    map7.putAll(arr1)

    for ((k, v) in map4) {
        println("put.  key is ${k}, the value is ${v}")
    }

    // 移除
    let map8 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    map5.remove("c")

    for ((k, v) in map4) {
        println("remove. key is ${k}, the value is ${v}")
    }
}
