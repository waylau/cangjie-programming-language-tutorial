import std.fs.*
import std.io.*
import std.collection.*

/// 实战：词频统计
main() {
    let file_read_name = "data.txt"

    // 判断指定的文件是否存在
    let exist = File.exists(file_read_name)
    println("exist: ${exist}")

    if (exist) {
        try (file = File.openRead(file_read_name)) {
             // 读取所有数据
            let bytes = file.readToEnd()

            let content = String.fromUtf8(bytes)
            println("content: ${content}")

            // 获取词频统计的 HashMap
            let frequency_map = getFrequencyMap(content)

            // 打印结果
            printFrequencyMap(frequency_map)
        }
    }
}

// 获取词频统计的 HashMap
func getFrequencyMap(content: String): HashMap<String, UInt64> {
    // 分割字符串为单词数组
    let words = content.split(" ", removeEmpty: true);

    var frequency_map = HashMap<String, UInt64>();

    // 统计每个单词的出现次数
    for (word in words) {
        let lower_case_word = word.toAsciiLower(); // 转换为小写
        if (!word.isEmpty()) {
            let contains = frequency_map.contains(lower_case_word)
            var count: UInt64 = 0
            if (contains) {
                count = frequency_map[lower_case_word]
            }

            count++

            // 更新词频
            frequency_map.put(lower_case_word, count);
        }
    }

    return frequency_map
}

// 打印结果
func printFrequencyMap(frequency_map: HashMap<String, UInt64>) {
    for ((word, frequency) in frequency_map) {
        println(" ${word} : ${frequency}")
    }
}
