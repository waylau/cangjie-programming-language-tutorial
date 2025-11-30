import net.http.*
import std.time.*
import std.sync.*
import std.log.LogLevel

// 1. 构建 Server 实例
let server = ServerBuilder()
    .addr("127.0.0.1")
    .port(8080)
    .build()

func start_server(): Unit {
    // 2. 注册请求处理逻辑
    var welcome: HttpRequestHandler = FuncHandler({ httpContext =>
        httpContext.responseBuilder.body("Welcome to waylau.com!")
    })
    var auther: HttpRequestHandler = FuncHandler({ httpContext =>
        httpContext.responseBuilder.body("I am Way Lau.")
    })
    var help: HttpRequestHandler = FuncHandler({ httpContext =>
        httpContext.responseBuilder.body("Read the help manual.")
    })
    server.distributor.register("/welcome", welcome)
    server.distributor.register("/auther", auther)
    server.distributor.register("/help", help)
	
    // 3. 启动服务
    server.serve()
}

main () {
	start_server()
}