
import std.collection.*

/// 删除字符串中出现次数最少的字符
func select_least(name: String) {
    // 遍历时统计每个字符的出现的次数
    let map = HashMap<Rune, UInt64>();
    for (ch in name.toRuneArray()) {
        let b = map.contains(ch)
        var count: UInt64 = 0
        if (b) {
            count = map[ch]
        }

        count++
        map.put(ch, count);
    }

    // 最小数量的字符用链表存储
    var min_list = ArrayList<Rune>();

    // 假设一个最大的数
    var min: UInt64 = 10000000000

    for ((ch, count) in map) {
        if (count < min) {
            min = count

            // 清空非最小值
            min_list.clear();

            min_list.append(ch);
        } else if (count == min) {
            min_list.append(ch);
        } else {
            // 什么都不做
        }
    }

    // 留下不是最小的字符
    var sb = StringBuilder()
    for (ch in name.toRuneArray()) {
        // 不是最小，就输出
        if (!min_list.contains(ch)) {
            sb.append(ch);
        }
    }

    // 输出
    print(sb.toString())
}

main(args: Array<String>) {
    // 只取第一个字符串
    let str = args[0]

    // 删除字符串中出现次数最少的字符
    select_least(str)
}

