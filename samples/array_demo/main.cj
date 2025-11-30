import std.sort.*


/// 数组
main() {
    /// 定义数组
    // 创建一个三原色数组
    let color_array: Array<String> = ["Red", "Green", "Blue"];

    // 访问数组
    let a = color_array[1];
    println("a: ${a}");

    // 省略了数组的类型及长度
    let color_array2 = ["Red", "Green", "Blue"];

    // 访问数组
    let a2 = color_array2[1];
    println("a2: ${a2}");

    // 创建一个每个元素都为相同值的数组
    // 等同于 let array3 = [0, 0, 0];
    let array3 = Array<Int64>(3, item: 0)

    // 访问数组
    let b = array3[0];
    println("b: ${b}");

    // 创建了一个数组，其元素类型为Int64，长度为3，所有元素都由初始化函数初始化
    let array4 = Array<Int64>(3, {i => i + 1})

    // 访问数组
    let d = array4[0];
    println("d: ${d}");

    // 定义数组
    let month_array = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ];

    // 遍历数组
    for (i in month_array) {
        println("The month is ${i}")
    }

    /// 修改数组
    let array5 = Array<Int64>(3, item: 0)
    array5[2] = 3

    // 遍历数组
    for (i in array5) {
        println("${i}")
    }

    /// Array 是引用类型
    // 定义数组
    let color_array3 = [0, 0, 0];
    let color_array_copy = color_array3;
    color_array_copy[0] = 1;

    //  Array 元素的修改会影响到该实例的所有引用
    println("The color is ${color_array3[0]}");

    /// 数组排序
    let array6 = [5, 4, 1, 2, 3];
    array6.sortBy(stable: true){ rht: Int64, lht: Int64 =>
        if (rht < lht) {
            return Ordering.LT
        }
        if (rht > lht) {
            return Ordering.GT
        }
        return Ordering.EQ
    }

    // 遍历数组
    for (i in array6) {
        println("${i}")
    }


    /// VArray 是值类型数组
    // 定义数组
    let color_varray: VArray<Int64, $3> = [0, 0, 0];
    var color_varray_copy = color_varray;
    color_varray_copy[0] = 1;

    //  Array 元素的修改会影响到该实例的所有引用
    println("The color is ${color_varray[0]}");
}

