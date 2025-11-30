import std.collection.*

/// ArrayList
main() {
    /// 初始化ArrayList
    // 创建了一个空的ArrayList，其元素类型为String
    let a = ArrayList<String>()

    //创建了一个元素类型为String的ArrayList，并分配了容量100
    let b = ArrayList<String>(100)

    // 创建了一个元素类型为Int64的ArrayList，包含元素0、1、2
    let c = ArrayList<Int64>([0, 1, 2])

    // 使用另一个集合初始化ArrayList
    let d = ArrayList<Int64>(c)

    // 创建了一个元素类型为String、大小为2的ArrayList。
    // 所有元素都由指定的规则函数初始化
    let e = ArrayList<String>(2, {x: Int64 => x.toString()})

    /// 访问ArrayList
    // 使用 size 属性获得对应信息
    let list = ArrayList<Int64>([0, 1, 2])
    for (i in list) {
        println("The element is ${i}")
    }

    // 使用 size 属性获得对应信息
    let list2 = ArrayList<Int64>([0, 1, 2])
    if (list2.size == 0) {
        println("This is an empty ArrayList")
    } else {
        println("The size of ArrayLists is ${list2.size}")
    }

    // 使用下标语法访问
    println("The element is ${list2[0]}")

    /// 修改 ArrayList
    let list3 = ArrayList<Int64>([0, 1, 2])
    list3[0] = 1
    println("The element is ${list3[0]}")

    // 同一个 ArrayList 实例的所有引用都会共享同样的数据
    let list4 = list3
    list4[0] = 0
    println("The element is ${list3[0]}")

    // 添加到 ArrayList 的末尾
    let list5 = ArrayList<Int64>()
    list5.append(0)
    list5.append(1)
    let arr1 = [2, 3]
    list5.appendAll(arr1)

    for (i in list5) {
        println("append: ${i}")
    }

    // 插入到指定索引的位置
    let list7 = ArrayList<Int64>([0, 1, 2])

    list7.insert(1, 3)

    var arr2: Array<Int64> = [6, 7, 8]
    list7.insertAll(1, arr2)

    for (i in list7) {
        println("insert: ${i}")
    }

    // 移除
    let list8 = ArrayList<String>(["a", "b", "c", "d"])
    list8.remove(2)

    for (i in list8) {
        println("remove: ${i}")
    }


    /// 增加 ArrayList 的大小
    // 初始分配容量100
    let list9 = ArrayList<Int64>(100)
    for (i in 0..100) {
        // 此时不触发扩容
        list9.append(i)
    }

    // 准备了更多空间
    list9.reserve(100)

    for (i in 0..100) {
        // 此时不触发扩容
        list9.append(i)
    }
}
