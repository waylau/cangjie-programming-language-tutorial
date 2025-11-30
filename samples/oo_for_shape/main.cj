/// 面向对象的图形
interface Shape {
    func area(): Float64
}

class Circle <: Shape {
    let radius: Float64

    init(radius: Float64) {
        this.radius = radius
    }

    public func area(): Float64 {
        return 3.14 * this.radius * this.radius
    }
}

class Rectangle <: Shape {
    let width: Float64
    let height: Float64

    init(width: Float64, height: Float64) {
        this.width = width
        this.height = height
    }

    public func area(): Float64 {
        return this.width * this.height
    }
}

func print_area(shape: Shape) {
    println("Area: ${ shape.area()}");
}

main() {
    let circle = Circle(2.0);
    let rectangle = Rectangle(3.0, 4.0);

    print_area(circle);
    print_area(rectangle);
}
