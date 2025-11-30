package kv_store


main() {
    // 初始化数据库
    let db = KeyValueStore();

    // 设置数据
    db.set("key1", "waylau.com");

    // 获取存在的数据
    let option_value1 = db.get("key1");

    match (option_value1) {
        case Some(value) => println("key1 value: ${value}")
        case None => println("key1 value: None")
    }

    // 获取不存在的数据
    let option_value2 = db.get("key2");

    match (option_value2) {
        case Some(value) => println("key2 value: ${value}")
        case None => println("key2 value: None")
    }
}

