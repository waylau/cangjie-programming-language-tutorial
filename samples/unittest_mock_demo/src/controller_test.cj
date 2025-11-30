package unittest_mock_demo

//导入mock框架包
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

@Test
class ControllerTest {
    let testId: UInt64 = 100
    let testResponse = "foo"

    @TestCase
    func testFindSuccessfully() {
        //只需要创建mock，不用创建真正的Repository
        let repository = mock<Repository>()

        //使用@On宏配置testData行为
        @On(repository.requestData(testId, _)).returns(testResponse)

        //创建真正的Controller测试以便测试实际的实现
        let controller = Controller(repository)

        //运行测试代码
        let result = controller.findData(testId)

        //对结果运行断言
        @Assert(result == Some(testResponse))
    }

    @TestCase
    func testTimeout() {
        let repository = mock<Repository>()

        //设置getData抛出异常
        @On(repository.requestData(testId, _)).throws(TimeoutException())

        let controller = Controller(repository)

        //底层实现抛出异常时，测试行为
        let result = controller.findData(testId)

        //对结果运行断言
        @Assert(result == None)
    }
}