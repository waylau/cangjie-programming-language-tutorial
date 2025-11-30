package snowflake_algorithm


main(): Int64 {
    // 初始化雪花算法
    let snowflake = Snowflake(0, 0)

    // 循环生成50次ID
    for (i in 0..50) {
        let id = snowflake.nextId()
        println(id)
    }
    return 0
}