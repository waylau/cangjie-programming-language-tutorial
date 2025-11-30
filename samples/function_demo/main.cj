/// 函数示例
// main函数是程序入口
main() {
    // 执行函数
    println_hello();

    // 执行函数传递参数
    let text = 999;
    println_text(text);

    // 获取函数的返回值
    let a: Int64 = 1;
    let b: Int64 = 1;
    let add_result = add(a, b);
    println("add result: ${add_result}");

    let add_string_result = add_string('a', 'b');
    println("add result: ${add_string_result}");
}

// 自定义函数
func println_hello() {
    // 打印Hello World!
    println("Hello World!");
}

// 如果函数定义了参数，则参数都需要标注类型
func println_text(text: Int64) {
    println("text: ${text}");
}


// 定义带返回的函数
func add(a: Int64, b: Int64): Int64 {
    // 等同于 
    // return a + b;
    a + b
}


/* 
// 错误！命名参数之后不能再出现非命名参数
func add(a!: Int64, b: Int64): Int64 {
    return a + b
}
*/


// 未定义带返回的函数，函数的返回值类型会自动推导
func add_string(a: String, b: String) {
    // 等同于 
    // return a + b;
    a + b
}