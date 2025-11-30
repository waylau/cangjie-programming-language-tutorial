package ohos_app_cangjie_entry

import std.console.*
import std.convert.*

/// 实现“剪刀石头布”游戏
main() {
    println("Rock Sissors Paper! 1-3");

    println("Player 1 guess.");

    // 标准输入流（stdIn）读取一行
    let line = Console.stdIn.readln()
    var line_str = ""
    try {
        line_str = line.getOrThrow()
    } catch (e: NoneValueException) {
        println("Player 1 guess none")

        // 终止程序
        return
    }

    // 字符串转为整型
    var player_guess1: Int64 = 0;

    try {
        player_guess1 = Int64.parse(line_str)
    } catch (e: IllegalArgumentException) {
        println("Player 1 guess IllegalArgumentException")

        // 终止程序
        return
    }

    println("Player 2 guess.");

    // 标准输入流（stdIn）读取一行
    let line2 = Console.stdIn.readln()
    var line_str2 = ""
    try {
        line_str2 = line2.getOrThrow()
    } catch (e: NoneValueException) {
        println("Player 2 guess none")

        // 终止程序
        return
    }

    // 字符串转为整型
    var player_guess2: Int64 = 0;
    try {
        player_guess2 = Int64.parse(line_str2)
    } catch (e: IllegalArgumentException) {
        println("Player 2 guess IllegalArgumentException")

        // 终止程序
        return
    }

    // 转为  tuple 值
    let vs = (player_guess1, player_guess2);

    // 比大小
    match (vs) {
        case (1, 2) => println("Player 1 win! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (1, 1) => println("Drew! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (1, 3) => println("Player 2 win! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (2, 3) => println("Player 1 win! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (2, 2) => println("Drew! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (2, 1) => println("Player 2 win! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (3, 1) => println("Player 1 win! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (3, 3) => println("Drew! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case (3, 2) => println("Player 2 win! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
        case _ => println("Illegal input! Player 1: ${player_guess1}, Player 2: ${player_guess2}")
    }
}

