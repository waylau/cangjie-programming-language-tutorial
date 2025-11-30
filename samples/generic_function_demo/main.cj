import std.collection.*

/// 全局泛型函数
func id<T>(t: T): T {
    return t
}

func composition<T1, T2, T3>(f: (T1) -> T2, g: (T2) -> T3): (T1) -> T3 {
    return {x: T1 => g(f(x))}
}

func times2(a: Int64): Int64 {
    return a * 2
}

func plus10(a: Int64): Int64 {
    return a + 10
}

func times2plus10(a: Int64) {
    return composition<Int64, Int64, Int64>(times2, plus10)(a)
}

/// 局部泛型函数
func foo(a: Int64) {
    func idInFunc<T>(a: T): T {
        a
    }

    func double(a: Int64): Int64 {
        a + a
    }

    return (idInFunc<Int64> ~> double)(a) == (double ~> idInFunc<Int64>)(a)
}

/// 泛型成员函数
class A {
    func foo<T>(a: T): Unit where T <: ToString {
        println("${a}")
    }
}

struct B {
    func bar<T>(a: T): Unit where T <: ToString {
        println("${a}")
    }
}

enum C {
    | X | Y

    func coo<T>(a: T): Unit where T <: ToString {
        println("${a}")
    }
}

extend Int64 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        println(this)
        println("${a}")
    }
}

/// 静态泛型函数

class ToPair {
    public static func fromArray<T>(l: ArrayList<T>): (T, T) {
        return (l[0], l[1])
    }
}

/// 泛型函数
main() {
    println(times2plus10(9))

    println(foo(1))

    let a = A()
    let b = B()
    let c = C.X
    a.foo<Int64>(10)
    b.bar<String>("abc")
    c.coo<Bool>(false)

    let d: Int64 = 12
    d.printIntAndArg<String>("twelve")

    let res: ArrayList<Int64> = ArrayList([1, 2, 3, 4])
    let e: (Int64, Int64) = ToPair.fromArray<Int64>(res)

    return 0
}

