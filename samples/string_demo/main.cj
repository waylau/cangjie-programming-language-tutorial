/// String类型操作
main() {
    /// 构造的字符串
    // 字符串转为 UTF-8 编码的字节数组
    let utf8Data: Array<UInt8> = 'waylau.com'.toArray();

    // 根据 UTF-8 编码的字节数组构造一个字符串
    let stringFromUtf8 = String.fromUtf8(utf8Data);
    println('stringFromUtf8: ${stringFromUtf8}');

    /// 搜索字符串
    let a = 'a';

    // 判断原字符串中是否包含字符串
    let containsResult: Bool = 'waylau.com'.contains(a);
    println('containsResult: ${containsResult}');

    let w = 'w';

    // 返回子字符串在原字符串中出现的次数
    let countResult: Int64 = 'Welcome to waylau.com!'.count(w);
    println('countResult: ${countResult}');

    let m = 'm';

    // 判断原字符串是否以指定字符串为后缀结尾
    let endsWithResult: Bool = 'waylau.com'.endsWith(m);
    println('endsWithResult: ${endsWithResult}');

    let startsWithResult: Bool = 'waylau.com'.startsWith(m);
    println('startsWithResult: ${startsWithResult}');


    /// 连接字符串
    let strArray: Array<String> = ['Welcome', 'to', 'waylau.com!'];

    // 未指定用于连接的中间字符串
    let stringJoin1 = String.join(strArray);
    println('stringJoin1: ${stringJoin1}');

    // 指定用于连接的中间字符串为 ' '
    let stringJoin2 = String.join(strArray, delimiter: ' ');
    println('stringJoin2: ${stringJoin2}');


    /// 替换
    let old = 'Welcome';
    let new = 'WELCOME';

    // 使用新字符串替换原字符串中旧字符串
    let replaceResult: String = 'Welcome to waylau.com!'.replace(old, new);
    println('replaceResult: ${replaceResult}');
}

