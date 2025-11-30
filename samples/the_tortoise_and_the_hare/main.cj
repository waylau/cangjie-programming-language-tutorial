import std.sync.*
import std.time.*
import std.collection.*

// 乌龟的速度
const TORTOISE_SPEED: UInt64 = 1

// 兔子的速度
const HARE_SPEED: UInt64 = 2

// 赛道长度
const DISTANCE: UInt64 = 50

// 休息距离
const PER_DISTANCE_SLEEP: UInt64 = 10

// 睡觉持续时间
const SLEEP_DURATION: Int64 = 8



/// 实战：龟兔赛跑
main(): Int64 {

    // 创建2个线程
    let tortoise = spawn {
        var tortoise_distance: UInt64 = 0

        while (true) {
            tortoise_distance += TORTOISE_SPEED

            // 每1秒记录下进度
            sleep(Duration.second)

            if (tortoise_distance >= DISTANCE) {
                break
            }

            println("tortoise_distance: ${tortoise_distance}")
        }

        return "TORTOISE"
    }

    let hare = spawn {
        var hare_distance: UInt64 = 0

        while (true) {
            hare_distance += HARE_SPEED

            // 每1秒记录下进度
            sleep(Duration.second)

            if (hare_distance >= DISTANCE) {
                break
            }

            println("hare_distance: ${hare_distance}")

            // 每10米睡8秒
            if (hare_distance % PER_DISTANCE_SLEEP == 0) {
                println("Hare sleep")
                sleep(SLEEP_DURATION * Duration.second)
            }
        }

        return "HARE"
    }

    let list = ArrayList<Future<String>>()
    list.append(tortoise)
    list.append(hare)

    // 等待所有线程完成
    for (f in list) {
        // 等待新创建的线程执行完成并获取结果
        let result: String = f.get()
        println("${result} success!")
    }

    return 0
}
