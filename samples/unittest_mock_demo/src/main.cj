package unittest_mock_demo

public interface Repository {
    func requestData(id: UInt64, timeoutMs: Int): String
}

public class Controller {
    public Controller(
        private let repo: Repository
    ) {}

    public func findData(id: UInt64): ?String {
        try {
            return repo.requestData(id, 100)
        }
        catch (e: TimeoutException) {
            return None
        }
    }
}

public class TimeoutException <: Exception {}

main(): Int64 {
    println("hello world")
    return 0
}