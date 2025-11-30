/// 程序结构示例
let g = 2022
func b() {}
struct C {}
class D {}
enum E { F | G }

func a() {
    let b = 2023
    func c() {
        println(b)
    }
    c()
}

class A {
    let b = 2024
    public func c() {
        println(b)
    }
}

main() {
    println(g)
    
    a()
    A().c()
}
