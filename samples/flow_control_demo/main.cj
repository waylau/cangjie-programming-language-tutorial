/// 流程控制示例
import std.random.*

// main函数是程序入口
main() {
    // 分支控制
    // 生成随机数
    let number: Int8 = Random().nextInt8();

    if (number % 2 == 0) {
        println("${number} is an even number");
    } else {
        println("${number} is an odd number");
    }


    // 处理多重条件
    let number2: Int8 = Random().nextInt8();
    if (number2 % 4 == 0) {
        println("${number2} is divisible by 4");
    } else if (number2 % 3 == 0) {
        println("${number2} is divisible by 3");
    } else if (number2 % 2 == 0) {
        println("${number2} is divisible by 2");
    } else {
        println("${number2} is not divisible by 4, 3, or 2");
    }

    
    // while循环
    var number3 = 1;
    while (number3 != 4) {
        println("number3: ${number3}");
        number3 += 1;
    }

    // for-in循环
    let array = [10, 20, 30, 40, 50];
    for (number in array) {
        println("number: ${number}");
    }


    // do-while循环
    var number4 = 1;
    do {
        println("number4: ${number4}");
        number4 += 1;
    } while (number4 != 4)
}
