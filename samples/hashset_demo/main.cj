import std.collection.*

/// HashSet
main() {
    /// 初始化HashSet
    // 创建了一个空的HashSet，其元素类型为String
    let a = HashSet<String>()

    //创建了一个元素类型为String的HashSet，并分配了容量100
    let b = HashSet<String>(100)

    // 创建了一个元素类型为Int64的HashSet，包含元素0、1、2
    let c = HashSet<Int64>([0, 1, 2])

    // 使用另一个集合初始化HashSet
    let d = HashSet<Int64>(c)

    // 创建了一个元素类型为String、大小为2的HashSet。
    // 所有元素都由指定的规则函数初始化
    let e = HashSet<String>(2, {x: Int64 => x.toString()})

    /// 访问HashSet
    // 使用 for-in 循环遍历 HashSet 的所有元素
    let set = HashSet<Int64>([0, 1, 2])
    for (i in set) {
        println("The element is ${i}")
    }

    // 使用 size 属性获得对应信息
    let set2 = HashSet<Int64>([0, 1, 2])
    if (set2.size == 0) {
        println("This is an empty HashSet")
    } else {
        println("The size of HashSets is ${set2.size}")
    }

    // 判断某个元素是否被包含在某个 HashSet 中
    let set3 = HashSet<Int64>([0, 1, 2])
    let b1 = set3.contains(0)
    let b2 = set3.contains(-1)
    println("b1: ${b1}, b2: ${b2}")

    // 添加到 HashSet 的末尾
    let set4 = HashSet<Int64>()
    set4.put(0)
    set4.put(1)
    let arr1 = [2, 3]
    set4.putAll(arr1)

    for (i in set4) {
        println("The element is ${i}")
    }

    // 移除
    let set5 = HashSet<String>(["a", "b", "c", "d"])
    set5.remove("c")

    for (i in set5) {
        println("remove: ${i}")
    }

}
