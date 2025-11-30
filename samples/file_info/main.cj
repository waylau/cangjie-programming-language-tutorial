
import std.fs.*
import std.time.DateTime

/// 实战：读写文件
main() {
    let file_read_name = "data.txt"

    let exist = File.exists(file_read_name)
    println("exist: ${exist}")

    if (exist) {
        try (file = File.openRead(file_read_name)) {
            // 读取所有数据
            let fileInfo: FileInfo = file.info

            // 获取这个文件的创建时间、最后访问时间、最后修改时间
            println("creationTime: ${fileInfo.creationTime}")
            println("lastAccessTime: ${fileInfo.lastAccessTime}")
            println("lastModificationTime: ${fileInfo.lastModificationTime}")

            // 获取这个文件的占用磁盘空间的大小
            println("length: ${fileInfo.length}")

            // 判断这个文件是否是软链接、普通文件、目录
            println("isSymbolicLink: ${fileInfo.isSymbolicLink()}")
            println("isFile: ${fileInfo.isFile()}")
            println("isDirectory: ${fileInfo.isDirectory()}")

            // 判断这个文件对于当前用户是否是只读、隐藏、可执行、可读、可写
            println("isReadOnly: ${fileInfo.isReadOnly()}")
            println("isHidden: ${fileInfo.isHidden()}")
            println("canExecute: ${fileInfo.canExecute()}")
            println("canRead: ${fileInfo.canRead()}")
            println("canWrite: ${fileInfo.canWrite()}")

        }
    }
}
