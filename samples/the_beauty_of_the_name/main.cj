
import std.collection.*
/// 名字的漂亮度

func doBeauty(name: String) {
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

    // map值转List
    var list = ArrayList<UInt64>();
    for ((k, v) in map) {
        list.append(v);
    }

    // 由小到大排序
    list.sortBy(stable: true) {
        rht: UInt64, lht: UInt64 =>
        if (rht < lht) {
            return Ordering.LT
        }
        if (rht > lht) {
            return Ordering.GT
        }
        return Ordering.EQ
    }

    // 总和
    let size: UInt64 = UInt64(map.size);
    var beautyValue: UInt64 = 26 - size + 1;
    var total: UInt64 = 0;
    for (count in list) {
        total += count * beautyValue
        beautyValue++;
    }

    return total;
}

main() {
    // 输入名字
    let name_arry = ["BoB", "Tomcat", "JohnJackson", "LucyLang", "LiLy", "WayLau"]

    for (name in name_arry) {
        let v = doBeauty(name)
        println("name:${name}, beauty: ${v}");
    }
}

