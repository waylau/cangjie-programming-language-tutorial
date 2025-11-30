
import std.sync.*
import std.time.*
import std.collection.*

// 总票数
const TOTAL: Int64 = 100

var current_count: Int64 = 0

// 使用ReentrantMutex来保护对全局共享变量current_count的访问
let mtx = ReentrantMutex()

/// 实战：‌多窗口售票
main(): Int64 {
    let list = ArrayList<Future<String>>()
    // 创建3个线程
    let array: Array<String> = ["Window 1", "Window 2", "Window 3"];
    for (window in array) {
        let f = spawn {
            while (true) {
                // 每1秒记录下进度
                sleep(Duration.second)

				// 加锁
				mtx.lock()
				
                if (current_count >= TOTAL) {
					// 解锁
					mtx.unlock()
                    break
                } else {
                    current_count ++
					println("${window} sale: ${current_count}")

                }
				
				// 解锁
				mtx.unlock()
            }

            return window
        }

        list.append(f)
    }

    // 等待所有线程完成
    for (f in list) {
        // 等待新创建的线程执行完成并获取结果
        let result: String = f.get()
        println("${result} complete!")
    }

    return 0
}
