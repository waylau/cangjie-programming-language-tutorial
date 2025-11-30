import std.socket.*
import std.time.*
import std.sync.*

let SERVER_PORT: UInt16 = 8080

func runUdpServer() {
    try (serverSocket = UdpSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()

        let buf = Array<Byte>(3, item: 0)
        let (clientAddr, count) = serverSocket.receiveFrom(buf)
        let sender = clientAddr.hostAddress

        // Server receive 3 bytes: [1, 2, 3] from 127.0.0.1
        println("Server receive ${count} bytes: ${buf} from ${sender}")
    }
}

main(): Int64 {
    let future = spawn {
        runUdpServer()
    }
    sleep(Duration.second)

    try (udpSocket = UdpSocket(bindAt: 0)) {
        udpSocket.sendTimeout = Duration.second * 2
        udpSocket.bind()
        udpSocket.sendTo(
            SocketAddress("127.0.0.1", SERVER_PORT),
            Array<Byte>([1, 2, 3])
        )
    }

    future.get()

    return 0
}