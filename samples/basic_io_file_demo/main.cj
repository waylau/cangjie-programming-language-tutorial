import std.fs.*
import std.io.*

/// 实战：读写文件
main() {
	let file_read_name = "data.txt"
	
  let exist = File.exists(file_read_name)
  println("exist: ${exist}")
	
	if (exist) {
		try (file = File.openRead(file_read_name)) {
			let bytes = file.readToEnd() // 读取所有数据
			 
			println(String.fromUtf8(bytes))
			 
			let byteArrayStream = ByteArrayStream()
			byteArrayStream.write(bytes)
			
			let file_write_name = "file_to_write.txt"
			// 删除文件
			let file_read_exist = File.exists(file_write_name)
  		if (file_read_exist) {
			  File.delete(file_write_name)
			}
			
			// 创建文件
			let file_to_write = File.create(file_write_name)
			
			// 读取流中全部数据
			let arr = byteArrayStream.readToEnd()

			// 写入文件
			file_to_write.write(arr)
		}
	}
    
    
}
