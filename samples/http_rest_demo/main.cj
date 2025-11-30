
import net.http.*
import std.collection.*

let users = ArrayList<String>();

// 1. 构建 Server 实例
let server = ServerBuilder().addr("127.0.0.1").port(8080).build()

func start_server(): Unit {
    // 2. 注册请求处理逻辑
    server.distributor.register("/users", user_handler)

    // 3. 启动服务
    server.serve()
}

func user_handler(ctx: HttpContext): Unit {
    let request_method = ctx.request.method
    let buf = Array<Byte>(256, item: 0)
    ctx.request.body.read(buf)
    let request_body = String.fromUtf8(buf)

    println("request_method: ${request_method}, request_body: ${request_body}")

    match (request_method) {
        case 'POST' =>
            users.append(request_body)
            ctx.responseBuilder.body("OK!")
        case 'PUT' =>
            for (i in 0..users.size) {
                if (request_body == users[i]) {
                    users.set(i, request_body);
                    break;
                }
            }
            ctx.responseBuilder.body("OK!")
        case 'DELETE' => for (i in 0..users.size) {
            if (request_body == users[i]) {
                users.remove(i)
                break;
            }
        }
        case _ => ctx.responseBuilder.body(list_to_string(users))
    }
}

// ArrayList 转为字符串
func list_to_string(list: ArrayList<String>): String {
    var sb = StringBuilder()
    for (i in list) {
        sb.append(i);
    }

    // 输出
    return sb.toString()
}

main() {
    start_server()
}
