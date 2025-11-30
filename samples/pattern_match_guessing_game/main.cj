import std.console.*
import std.convert.*

/// 猜数字游戏
main() {
    println("Guess the number! 1-100");

    // 被猜的数字
    let secret_number = 41;

    while (true) {
        println("Please input your guess.");

        // 标准输入流（stdIn）读取一行
        let line = Console.stdIn.readln()
        var lineStr = line.getOrThrow();

        // 字符串转为整型
        let guess: Int64 = Int64.parse(lineStr);

        println("You guessed: ${guess}");

         // 比大小
        let result = match {
            case guess < secret_number => "Too small!";
            case guess > secret_number => "Too big!";
            case _ => "You win!";
        }

        println("${result}");

        // 退出循环
        if (result == "You win!") {
            break;
        }
    }
}