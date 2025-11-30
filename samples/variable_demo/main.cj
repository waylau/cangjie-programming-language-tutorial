/// 变量示例
main() {
    // 声明不变量a，并初始化值1
    let a = 1;
    println("a: ${a}");

    /*
    // 错误！不能对不可变变量a二次赋值
    a = 2;
    */

    /*
    // 声明未使用的变量c，并初始化值1
    let c = 1;
    // 告警！c没有任何地方用到
    */

    
    // 声明可变变量b，并初始化值1
    var b = 1;
    println("b: ${b}");

    // 修改变量b的值为2
    b = 2;
    println("b: ${b}");

    // 声明常量ONE_DAY_IN_SECONDS，并初始化值
    const ONE_DAY_IN_SECONDS = 60 * 60 * 24;
    println("ONE_DAY_IN_SECONDS: ${ONE_DAY_IN_SECONDS}");
    
    
}
