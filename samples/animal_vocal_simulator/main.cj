
import std.collection.*

/// 动物发声模拟器

// 定义动物抽象类
abstract class Animal {
    public func sound(): String
}

class Lion <: Animal {
    public func sound(): String {
        return "Lion sounds: roar"
    }
}

class Sheep <: Animal {
    public func sound(): String {
        return "Sheep sounds: baa"
    }
}

class Zoo<T> where T <: Animal {
    var animals: ArrayList<Animal> = ArrayList<Animal>()
    public func addAnimal(a: T) {
        animals.append(a)
    }

    public func allAnimalSound() {
        for (a in animals) {
            println(a.sound())
        }
    }
}

main() {
    var zoo: Zoo<Animal> = Zoo<Animal>()
    zoo.addAnimal(Lion())
    zoo.addAnimal(Sheep())
    zoo.allAnimalSound()
    return 0
}
